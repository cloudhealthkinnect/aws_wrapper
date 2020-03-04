RSpec.describe AwsWrapper::Syncable do
  let(:model)            { Object.new }

  let(:model_attributes) { { first_name: 'James', last_name: 'Reid' } }
  let(:microservices)    { ['CareleverScreening'] }

  let(:sns_publisher)    { double(:sns_publisher, call: nil) }

  before do
    model.extend(AwsWrapper::Syncable)
    allow(AwsWrapper::SnsPublisher).to receive(:new).and_return(sns_publisher)

    allow(model).to receive(:model_data).and_return(model_attributes)
    allow(model).to receive(:microservices).and_return(microservices)
  end

  describe '#publish_sns' do
    it 'initializes the AwsWrapper::SnsPublisher with correct args' do
      model.publish_sns('create')

      expect(AwsWrapper::SnsPublisher).to have_received(:new).with(
        activerecord_action: 'create',
        model_name:          'Object',
        model_data:          model_attributes,
        microservices:       microservices
      )
    end
  end

  context 'when being included in ActiveRecord' do
    let(:location) { Location.new(name: 'Brisbane', state: 'QLD') }

    before { allow(location).to receive(:microservices).and_return(microservices) }

    describe 'on create' do
      it 'initializes the AwsWrapper::SnsPublisher with correct args' do
        location.save

        expect(AwsWrapper::SnsPublisher).to have_received(:new).with(
          activerecord_action: 'create',
          model_name:          Location.name,
          model_data:          location.attributes,
          microservices:       microservices
        )
      end
    end

    describe 'on update' do
      before { location.save }

      it 'initializes the AwsWrapper::SnsPublisher with correct args' do
        location.update(name: 'I am the new site')

        expect(AwsWrapper::SnsPublisher).to have_received(:new).with(
          activerecord_action: 'update',
          model_name:           Location.name,
          model_data:          location.attributes,
          microservices:       microservices
        )
      end
    end

    describe 'on destroy' do
      before { location.save }

      it 'initializes the AwsWrapper::SnsPublisher with correct args' do
        location.destroy

        expect(AwsWrapper::SnsPublisher).to have_received(:new).with(
          activerecord_action: 'destroy',
          model_name:          Location.name,
          model_data:          location.attributes,
          microservices:       microservices
        )
      end
    end
  end
end

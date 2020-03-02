RSpec.describe CareleverSyncable do
  let(:model) { Object.new }

  let(:model_attributes) { { first_name: 'James', last_name: 'Reid' } }
  let(:model_microservices) { ['CareleverScreening'] }

  let(:sns_publisher) { double(:sns_publisher, call: nil) }

  before do
    model.extend(CareleverSyncable)
    allow(SnsPublisher).to receive(:new).and_return(sns_publisher)

    allow(model).to receive(:model_data).and_return(model_attributes)
    allow(model).to receive(:microservices).and_return(model_microservices)
  end

  describe '#publish_sns' do
    it "calls the 'call' method of SnsPublisher with correct args" do
      expect(SnsPublisher).to receive(:new).with(
        action:        'create',
        model_name:    'Object',
        model_data:    model_attributes,
        microservices: model_microservices
      )
      model.publish_sns('create')
    end
  end
end

RSpec.describe SnsPublisher do
  subject(:publisher) { SnsPublisher.new(data) }

  let(:data)       { { first_name: 'James', last_name: 'Reid' } }
  let(:aws_config) { { sns_topic_arn_data_sync_publisher: 'publish-arn.aws.com/123'} }
  let(:aws_client) { instance_double(AwsClient) }
  let(:sns)        { double(:sns) }

  before do
    allow(aws_client).to receive(:aws_config).and_return(aws_config)
    allow(aws_client).to receive(:sns).and_return(sns)
    allow(sns).to receive(:publish).and_return(true)

    allow(AwsClient).to receive(:new).and_return(aws_client)
  end

  describe '#call' do
    it "calls the 'call' method of SnsPublisher with correct args" do
      publisher.call

      expect(sns).to have_received(:publish).with(
        topic_arn: 'publish-arn.aws.com/123',
        message:   data.to_json
      )
    end
  end
end

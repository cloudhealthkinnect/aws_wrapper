RSpec.describe AwsClient do
  subject(:client) { AwsClient.new }

  let(:aws_config)  { { sns_topic_arn_data_sync_publisher: 'publish-arn.aws.com/123'} }
  let(:aws_client)  { instance_double(Aws::SNS::Client) }
  let(:application) { double(:application) }

  before do
    allow(aws_client).to receive(:kind_of?).with(Aws::SNS::Client)
                     .and_return(true)

    allow(application).to receive(:config_for).with('aws_config')
                      .and_return(aws_config)

    allow(Rails).to receive(:application)
                .and_return(application)

    allow(Aws::SNS::Client).to receive(:new)
                           .and_return(aws_client)

  end

  describe '#sns' do
    it 'returns an object with instance of Aws::SNS::Client' do
      expect(client.sns).to be_a Aws::SNS::Client
    end
  end

  describe '#aws_config' do
    it 'returns mocked aws_config' do
      expect(client.aws_config).to eq aws_config
    end
  end
end

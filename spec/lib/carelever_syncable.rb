# Todo: Improve this require
# require File.join(ROOT_LIB, 'carelever_syncable.rb')

RSpec.describe CareleverSyncable do
  let(:location) { Location.new(name: 'test') }
  # let(:aws_config) { { sns_topic_arn_data_sync_publisher: 'KINNECT2020.aws.com/123' } }

  before do
    allow_any_instance_of(SnsPublisher).to receive(:call)
  end

  it 'test' do
    expect(location).to receive(:publish_sns)
    location.save
  end
end

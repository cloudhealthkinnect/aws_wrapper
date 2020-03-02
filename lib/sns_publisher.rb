 # frozen_string_literal: true
require_relative 'aws_client'

class SnsPublisher
  def initialize(data_to_be_sent)
    @data_to_be_sent = data_to_be_sent
  end

  def call
    aws_client = AwsClient.new
    topic_arn  = aws_client.aws_config[:sns_topic_arn_data_sync_publisher]

    aws_client.sns.publish(topic_arn: topic_arn, message: @data_to_be_sent.to_json)
  end
end
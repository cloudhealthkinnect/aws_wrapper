 # frozen_string_literal: true
require_relative 'aws_client'

class SnsPublisher
  def initialize(data_to_be_sent)
    @data_to_be_sent = data_to_be_sent
  end

  def call
    topic_arn = aws_config[:sns_topic_arn_data_sync_publisher]
    AwsClient.new.sns.publish(topic_arn: topic_arn, message: @data_to_be_sent.to_json)
  end

  private

  def aws_config
    @aws_config ||= Rails.application.config_for(:aws_config).symbolize_keys
  end
end
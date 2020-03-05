# frozen_string_literal: true
require 'aws_wrapper/aws_client'

module AwsWrapper
  module Models
    class Sns
      USER_AGENT_VALUE = 'Amazon Simple Notification Service Agent'
      USER_AGENT_KEY   = 'HTTP_USER_AGENT'
      TOPIC_KEY        = 'HTTP_X_AMZ_SNS_TOPIC_ARN'

      def self.sns_webhook_call?(request:, topic_key:)
        aws_config = ::AwsWrapper::AwsClient.new.aws_config

        request.env[USER_AGENT_KEY] == USER_AGENT_VALUE &&
          request.env[TOPIC_KEY] == topic_key
      end
    end
  end
end

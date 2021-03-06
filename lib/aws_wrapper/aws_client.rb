 # frozen_string_literal: true
require 'aws-sdk-sns'

module AwsWrapper
  class AwsClient
    attr_reader :aws_config

    def initialize
      @aws_config = Rails.application.config_for('aws_config').symbolize_keys
    end

    def sns_client
      Aws::SNS::Client.new(region: @aws_config[:aws_default_region], credentials: credentials)
    end

    def sqs_client
      Aws::SQS::Client.new(region: aws_config[:aws_sqs_region], credentials: credentials)
    end

    def s3_emails
      Aws::S3::Client.new(region: @aws_config[:aws_s3_emails_region], credentials: credentials)
    end

    def dynamodb
      Aws::DynamoDB::Client.new(region: aws_config[:aws_default_region], credentials: credentials)
    end

    private

    def credentials
      @credentials ||= Aws::Credentials.new(aws_config[:aws_access_key], aws_config[:aws_secret_access_key])
    end
  end
end
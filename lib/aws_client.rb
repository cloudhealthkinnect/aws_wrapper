 # frozen_string_literal: true
require 'aws-sdk-sns'

class AwsClient
  attr_reader :aws_config

  def initialize
    @aws_config = Rails.application.config_for('aws_config').symbolize_keys
  end

  def sns
    Aws::SNS::Client.new(region: @aws_config[:aws_default_region])
  end
end

 # frozen_string_literal: true

 module Aws
  class Client
    def sns
      Aws::SNS::Client.new(region: aws_config[:aws_default_region])
    end

    def aws_config
      @aws_config ||= Rails.application.config_for('aws_config').symbolize_keys
    end
  end
end

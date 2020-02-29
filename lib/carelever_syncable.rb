 # frozen_string_literal: true
 ## This class can be included in ActiveRecord models so they can have the ability to
 ## automatically sync to other microservices
require 'sns_publisher'
require 'active_support'

 module CareleverSyncable
  extend ActiveSupport::Concern

  included do
    after_commit -> { publish_sns(activerecord_action) }
  end

  # Reason that it has a parameter is that we can manually call it without forcing the callback
  def publish_sns(action)
    SnsPublisher.new(
      action:        action,
      model_name:    self.class.name,
      model_data:    model_data,
      microservices: microservices
    ).call
  end

  private
  # Methods below can be overriden

  def activerecord_action
    if transaction_include_any_action?([:create])
      'create'
    elsif transaction_include_any_action?([:update])
      'update'
    elsif transaction_include_any_action?([:destroy])
      'destroy'
    else
      'other'
    end
  end

  def model_data
    attributes
  end

  # List of microservices that can receive this data sync
  def microservices
    []
  end
end
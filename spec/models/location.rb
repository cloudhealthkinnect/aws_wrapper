require 'aws_wrapper/syncable'

class Location < ActiveRecord::Base
  include AwsWrapper::Syncable
end

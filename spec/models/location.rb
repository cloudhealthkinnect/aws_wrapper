require 'carelever_syncable'

class Location < ActiveRecord::Base
  include CareleverSyncable
end

class Reason < ActiveRecord::Base
  has_many :content_removal_requests

  attr_accessible :name
end

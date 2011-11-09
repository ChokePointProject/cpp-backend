class Product < ActiveRecord::Base
  belongs_to :content_removal_request

  attr_accessible :name
end

class ContentRemovalRequest < ActiveRecord::Base
  belongs_to :content_removal_request_period
  has_many :products
  has_many :reasons

  attr_accessible :courtOrders, :executive, :items
end

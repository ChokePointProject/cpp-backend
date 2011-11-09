class ContentRemovalRequest < ActiveRecord::Base
  belongs_to :content_removal_request_period
  belongs_to :product
  belongs_to :reason

  attr_accessible :court_orders, :executive, :items
end

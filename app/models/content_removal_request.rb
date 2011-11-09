class ContentRemovalRequest < ActiveRecord::Base
  belongs_to :content_removal_request_period
  belongs_to :product
  belongs_to :reason

  attr_accessible :court_orders, :executive, :items

  def product_name
    self.product.name
  end

  def reason_name
    self.reason.name
  end

end

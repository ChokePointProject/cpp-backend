class ContentRemovalRequestPeriod < ActiveRecord::Base
  has_many :content_removal_requests

  attr_accessible :period_start, :period_end
end

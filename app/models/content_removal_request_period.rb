class ContentRemovalRequestPeriod < ActiveRecord::Base
  has_many :content_removal_requests
  has_one :country

  attr_accessible :period_start, :period_end, :percentage_complied
end

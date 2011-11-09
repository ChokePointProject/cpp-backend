class ContentRemovalRequestPeriod < ActiveRecord::Base
  belongs_to :country

  has_many :content_removal_requests

  attr_accessible :period_start, :period_end, :percentage_complied
end

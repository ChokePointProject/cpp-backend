class Country < ActiveRecord::Base
  belongs_to :continent

  has_many :content_removal_request_periods
  has_many :content_removal_requests, :through => :content_removal_request_periods

  validates_presence_of :code, :name
  validates_uniqueness_of :code

  attr_accessible :code, :name, :isoNumeric, :isoAlpha3, :fipsCode, :capital, :areaInSqKm, :population, :currencyCode, :languages, :geonameId, :bBoxWest, :bBoxNorth, :bBoxEast, :bBoxSouth
end

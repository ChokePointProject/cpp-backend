class Country < ActiveRecord::Base
  belongs_to :continent
  validates_presence_of :code, :name
  validates_uniqueness_of :code

  attr_accessible :code, :name, :isoNumeric, :isoAlpha3, :fipsCode, :capital, :areaInSqKm, :population, :currencyCode, :languages, :geonameId, :bBoxWest, :bBoxNorth, :bBoxEast, :bBoxSouth
end

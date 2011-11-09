class CountryMeasurement < ActiveRecord::Base
  belongs_to :country_map, :foreign_key => :country

  default_scope :order => 'month DESC'
end

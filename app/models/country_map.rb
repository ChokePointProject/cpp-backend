
class CountryMap < ActiveRecord::Base
  set_primary_key :country

  has_many :country_measurements, :foreign_key => 'country'
end

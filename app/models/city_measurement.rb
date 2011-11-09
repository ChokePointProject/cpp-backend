class CityMeasurement < ActiveRecord::Base
  attr_accessor :is_suspicious
  attr_accessor :country_id

  belongs_to :city_map

  default_scope :order => 'month DESC'

  def suspicious
    self.is_suspicious
  end

  def country_code
    begin 
      country_id = Integer(self.city.split('_')[0])
      country_name = CountryMap.where(:country => country_id)[0].name
      country_code = Country.find_by_name(country_name).code
    rescue
      nil
    end
  end
end

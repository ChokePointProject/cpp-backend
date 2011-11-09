class CityMap < ActiveRecord::Base
  has_many :city_measurements

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

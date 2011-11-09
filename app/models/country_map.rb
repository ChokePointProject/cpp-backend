
class CountryMap < ActiveRecord::Base
  set_primary_key :country

  has_many :country_measurements, :foreign_key => 'country'

  def country_code
    begin 
      Country.find_by_name(self.name).code 
    rescue 
      ''
    end

  end
end

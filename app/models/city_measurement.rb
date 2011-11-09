class CityMeasurement < ActiveRecord::Base
  attr_accessor :is_suspicious
  belongs_to :city_map

  default_scope :order => 'month DESC'

  def suspicious
    self.is_suspicious
  end
end

class CountryMeasurement < ActiveRecord::Base
  attr_accessor :is_suspicious
  belongs_to :country_map, :foreign_key => :country

  default_scope :order => 'month DESC'

  def suspicious
    self.is_suspicious
  end
end

class CountryMeasurement < ActiveRecord::Base
  attr_accessor :suspicious
  belongs_to :country_map, :foreign_key => :country

  default_scope :order => 'month DESC'

  def suspicious?
    self.suspicious
  end
end

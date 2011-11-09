class Continent < ActiveRecord::Base
  has_many :countries
  validates_presence_of :code, :name
  validates_uniqueness_of :code

  attr_accessible :code, :name
end

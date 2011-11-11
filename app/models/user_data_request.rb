class UserDataRequest < ActiveRecord::Base
  belongs_to :country

  attr_accessible :period_start, :period_end, :requests, :percentage_complied, :accounts
end

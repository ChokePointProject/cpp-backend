require 'test_helper'

class UserDataRequestTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert UserDataRequest.new.valid?
  end
end

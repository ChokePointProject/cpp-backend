require 'test_helper'

class ContinentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Continent.new.valid?
  end
end

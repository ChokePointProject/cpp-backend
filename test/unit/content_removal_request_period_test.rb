require 'test_helper'

class ContentRemovalRequestPeriodTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ContentRemovalRequestPeriod.new.valid?
  end
end

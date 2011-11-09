require 'test_helper'

class ReasonTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Reason.new.valid?
  end
end

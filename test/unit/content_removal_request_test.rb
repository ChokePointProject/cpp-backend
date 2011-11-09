require 'test_helper'

class ContentRemovalRequestTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ContentRemovalRequest.new.valid?
  end
end

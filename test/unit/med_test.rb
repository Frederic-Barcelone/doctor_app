require 'test_helper'

class MedTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Med.new.valid?
  end
end

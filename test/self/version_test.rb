require "test_helper"

class SelfVersionest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Takelage::VERSION
  end
end
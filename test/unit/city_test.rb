require 'test_helper'

class CityTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  test "city must have a name" do
  	city = City.new
  	assert city.invalid?
  end
end

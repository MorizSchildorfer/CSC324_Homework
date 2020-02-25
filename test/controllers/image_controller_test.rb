require 'test_helper'

class ImageControllerTest < ActionDispatch::IntegrationTest

  test "color grad for low input" do
    values= ImageController.calcColorGradient(10)
    assert_equal [255-64,30,64], values
  end
  test "color grad for mid-low input" do
    values= ImageController.calcColorGradient(64)
    assert_equal [255,255-64,64], values
  end
  test "color grad for mid-high input" do
    values= ImageController.calcColorGradient(158)
    assert_equal [64,255-64,90], values
  end
  test "color grad for high input" do
    values= ImageController.calcColorGradient(200)
    assert_equal [64,255-24,255-64], values
  end
  test "color grad bug with negative input" do
    values= ImageController.calcColorGradient(-10)
    assert_equal [255-64,-30,64], values
  end
  test "color grad bug with too large input" do
    values= ImageController.calcColorGradient(302)
    assert_equal [64,255-330,255-64], values
  end
  test "mapTo255 for positive min and positive max" do
    value= ImageController.mapTo255(6, 1, 11)
    assert_equal  127, value
  end

  test "mapTo255 for negative min and positive max" do
    value= ImageController.mapTo255(0, -1, 4)
    assert_equal  51, value
  end

  test "mapTo255 for negative min and negative max" do
    value= ImageController.mapTo255(-1, -6, -1)
    assert_equal  255, value
  end

  test "mapTo255 bug with input out of range" do
    value= ImageController.mapTo255(0, -6, -1)
    assert_equal  306, value
  end
end

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
  test "mapTo255 fixed behavior with divide by zero" do
    value= ImageController.mapTo255(0, 0, 0)
    assert_equal  0, value
  end
  
  test "calculateMinMaxOfData with all negative values" do
    testingHash = Hash.new(0)
    testingHash[[0,0]] = -1
    testingHash[[0,1]] = -2
    testingHash[[1,0]] = -4
    testingHash[[1,1]] = -1
    controllerTest = ImageController.new()
    controllerTest.image_width = 2
    controllerTest.image_height = 2
    controllerTest.image_data = testingHash
    testMin, testMax = controllerTest.calculateMinMaxOfData()
    assert_equal  -4, testMin
    assert_equal  -1, testMax
  end

  test "calculateMinMaxOfData with all positive values" do
    testingHash = Hash.new(0)
    testingHash[[0,0]] = 6
    testingHash[[0,1]] = 2
    testingHash[[1,0]] = 4
    testingHash[[1,1]] = 7
    controllerTest = ImageController.new()
    controllerTest.image_width = 2
    controllerTest.image_height = 2
    controllerTest.image_data = testingHash
    testMin, testMax = controllerTest.calculateMinMaxOfData()
    assert_equal  2, testMin
    assert_equal  7, testMax
  end

  test "calculateMinMaxOfData with mixed values" do
    testingHash = Hash.new(0)
    testingHash[[0,0]] = 0
    testingHash[[0,1]] = -2
    testingHash[[1,0]] = 4
    testingHash[[1,1]] = -7
    controllerTest = ImageController.new()
    controllerTest.image_width = 2
    controllerTest.image_height = 2
    controllerTest.image_data = testingHash
    testMin, testMax = controllerTest.calculateMinMaxOfData()
    assert_equal  -7, testMin
    assert_equal  4, testMax
  end
end

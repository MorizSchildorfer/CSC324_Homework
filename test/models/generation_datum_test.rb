require 'test_helper'

class GenerationDatumTest < ActiveSupport::TestCase
   def setup
    @dat = GenerationDatum.new( seed: 42, width: 10, height: 5, river_length: 2)
  end

  test "should be valid" do
    assert @dat.valid?
  end
  test "seed should be integer" do
    @dat.seed = -5.5
    assert_not @dat.valid?
  end
  test "width should be positive" do
    @dat.width = -5
    assert_not @dat.valid?
    @dat.width = 0
    assert_not @dat.valid?
  end

  test "height should be positive" do
    @dat.height = -5
    assert_not @dat.valid?
    @dat.height = 0
    assert_not @dat.valid?
  end

  test "river length should be non-negative" do
    @dat.river_length = -5
    assert_not @dat.valid?
    @dat.river_length = 0
    assert @dat.valid?
  end
end

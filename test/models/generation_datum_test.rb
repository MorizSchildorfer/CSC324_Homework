require 'test_helper'

class GenerationDatumTest < ActiveSupport::TestCase
   def setup
    @dat = GenerationDatum.new( seed: 42, width: 10, height: 5, river_length: 2)
  end

  test "should be valid" do
    assert @dat.valid?
  end

  test "width should be positive" do
    @dat.width = -5
    assert_not @dat.valid?
  end
end

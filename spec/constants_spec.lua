require "lib/constants"

describe("constants", function()

  it("has SIDE_LENGTH", function()
    assert_equal(ROW_LENGTH, 3)
  end)

  it("has CELL_COUNT", function()
    assert_equal(CELL_COUNT, 9)
  end)

end)

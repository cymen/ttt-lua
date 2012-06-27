require "lib/constants"

describe("Constants", function()

  context("row", function()
    it("has ROW_LENGTH", function()
      assert_equal(ROW_LENGTH, 3)
    end)
    
    it("has ROW_COUNT", function()
      assert_equal(ROW_COUNT, 8)
    end)
  end)

  context("cell", function()
    it("has CELL_COUNT", function()
      assert_equal(CELL_COUNT, 9)
    end)
  end)

end)

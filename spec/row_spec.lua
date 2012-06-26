require "lib/row"

describe("Row", function()

  context("create", function()
    it("can be created", function()
      row = Row.create({})
      assert_not_equal(row, nil)
    end)
  end)

  context("equality", function()
    it("compared by contents to another row", function()
      row = Row.create({1, 2, 3})
      assert_equal(row, Row.create({1, 2, 3}))
      assert_not_equal(row, Row.create({3, 2, 1}))
    end)
  end)

  context("tostring", function()
    it("prints nicely as 'value_1, value_2, value_3'", function()
      row = Row.create({'x', 'o', 'x'})
      assert_equal(row:__tostring(), "x, o, x")
    end)
  end)

end)

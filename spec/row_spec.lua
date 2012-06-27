require "lib/row"

describe("Row", function()

  context("create", function()
    it("can be created", function()
      local row = Row.create({})

      assert_not_equal(row, nil)
    end)
  end)

  context("identical_values_and_not_nil", function()
    it("returns false for empty row", function()
      local row = Row.create({})

      assert_false(row:identical_values_and_not_nil())
    end)

    context("returns false for rows with", function()
      it("multiple values", function()
        local row = Row.create({'x', 'o', 'x'})

        assert_false(row:identical_values_and_not_nil())
      end)

      it("two identical and an implicit nil", function()
        local row = Row.create({'x', 'x'})

        assert_false(row:identical_values_and_not_nil())
      end)
    end)

    it("returns true for identical row of non-nil", function()
      local row = Row.create({'x', 'x', 'x'})

      assert_true(row:identical_values_and_not_nil())
    end)
  end)


  context("equality", function()
    it("compared by contents to another row", function()
      local row = Row.create({1, 2, 3})

      assert_equal(row, Row.create({1, 2, 3}))
      assert_not_equal(row, Row.create({3, 2, 1}))
    end)
  end)

  context("tostring", function()
    it("prints nicely as 'value_1, value_2, value_3'", function()
      local row = Row.create({'x', 'o', 'x'})
      
      assert_equal(row:__tostring(), "x, o, x")
    end)

    context("handles nils", function()
      it("prints implict nil as underscore", function()
        local row = Row.create({'x', 'x'})

        assert_equal(row:__tostring(), 'x, x, _')
      end)

      it("prints explicit nil as underscore", function()
        local row = Row.create({nil, 'o', 'x'})

        assert_equal(row:__tostring(), '_, o, x')
      end)
    end)
  end)

end)

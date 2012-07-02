require "lib/board/row"
require "spec/spec_helper"

describe("Row", function()

  context("create", function()
    it("can be created", function()
      local row = Row.create()

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

  context("to_printable", function()
    local row
    it("converts an empty row to a row of three empty string", function()
      row = Row.create()

      assert_have_same_key_value_pairs(row:to_printable(), {"", "", ""})
    end)

    it("converts a row of nil to a row of empty string", function()
      row = Row.create({nil, nil, nil})

      assert_have_same_key_value_pairs(row:to_printable(), {"", "", ""})
    end)

    it("converts row of mixed nil and values to empty string and values", function()
      row = Row.create({nil, 'x', nil})

      assert_have_same_key_value_pairs(row:to_printable(), {"", "x", ""})
    end)

    it("leaves a row of values alone", function()
      row = Row.create({'o', 'x', 'o'})

      assert_have_same_key_value_pairs(row:to_printable(), {"o", "x", "o"})
    end)
  end)

end)

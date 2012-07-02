local StringUtil = require "lib/util/string_util"

describe("StringUtil", function()

  context("center", function()
    it("centers the provided string within the provided width", function()
      assert_equal(StringUtil.center("IBM", 5), " IBM ")
      assert_equal(StringUtil.center("IBM", 7), "  IBM  ")
    end)

    it("returns an empty string of width length if empty string provided", function()
      assert_equal(StringUtil.center("", 6), "      ")
    end)

    it("puts the odd space space after the provided string if doesn't fit evenly", function()
      assert_equal(StringUtil.center("a", 6), "  a   ")
    end)

    it("returns the provided string when the provided width is too small", function()
      assert_equal(StringUtil.center("abc", 1), "abc")
      assert_equal(StringUtil.center("zoom", 1), "zoom")
    end)

    it("converts to string if provided value is not a string", function()
      assert_equal(StringUtil.center(10, 4), " 10 ")
    end)
  end)

  context("ljust", function()
    it("left justifies the provided string to the provided length", function()
      assert_equal(StringUtil.ljust("a", 5), "a    ")
      assert_equal(StringUtil.ljust("Chicago", 10), "Chicago   ")
    end)

    it("returns the provided string when the provided length is too small", function()
      assert_equal(StringUtil.ljust("abcd", 2), "abcd")
    end)

    it("converts to string if provided value is not a string", function()
      assert_equal(StringUtil.ljust(5, 2), "5 ")
    end)
  end)

end)

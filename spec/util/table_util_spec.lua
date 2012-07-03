local TableUtil = require "lib/util/table_util"

describe("TableUtil", function()

  context("equal", function()
    it("identifies two empty tables as equal", function()
      assert_true(TableUtil.equal({}, {}))
    end)

    it("identifieds two tables as equal (having same key-value pairs)", function()
      assert_true(TableUtil.equal({1, 2}, {1, 2}))
      assert_false(TableUtil.equal({1}, {1, 2}))
      assert_true(TableUtil.equal({'a', 2, math.huge}, {'a', 2, math.huge}))
    end)

    it("identifies two tables as not equal", function()
      assert_false(TableUtil.equal({1, 2}, {2, 1}))
      assert_false(TableUtil.equal({}, {1}))
      assert_false(TableUtil.equal({1}, {1, 2}))
      assert_false(TableUtil.equal({1, 2}, {1}))
    end)
  end)

  context("max", function()
    it("returns the numeric max value of a table", function()
      assert_equal(TableUtil.max({1, 10, -5}), 10)
    end)

    it("errors if table contains a non-numeric value", function()
      assert_error(function() TableUtil.max({1, 'a', 3}) end)
    end)

    it("handles tables with holes", function()
      local _table = {}
      _table[2] = 10
      _table[20] = 300
      _table[999] = 50
      _table[300] = -1
      assert_equal(TableUtil.max(_table), 300)
    end)
  end)

  context("table1_within_table2", function()
    it("sees an empty table as being within another table empty or not", function()
      assert_true(TableUtil.table1_within_table2({}, {}))
      assert_true(TableUtil.table1_within_table2({}, {2}))
    end)

    it("sees a table with set A of values being within another table with at least set A", function()
      assert_true(TableUtil.table1_within_table2({'a', 'b'}, {'a', 'b', 'c'}))
      assert_true(TableUtil.table1_within_table2({20, 40}, {20, 40, 300}))
      
      assert_true(TableUtil.table1_within_table2({20, 40}, {20, 40}))
      
      assert_false(TableUtil.table1_within_table2({'a', 'b', 'c'}, {'a', 'b'}))
      assert_false(TableUtil.table1_within_table2({20, 40, 300}, {20, 40}))
    end)
  end)

  context("tostring", function()
    it("converts an empty table to {}", function()
      assert_equal(TableUtil.tostring({}), "{ }")
    end)

    it("converts a table with key 1 having value of 'a'", function()
      assert_equal(TableUtil.tostring({"a"}), "{ 1 -> 'a' }")
    end)

    it("converts a table with key 1 having a value of 10", function()
      assert_equal(TableUtil.tostring({10}), "{ 1 -> 10 }")
    end)

    it("converts a table with multiple keys having numeric values", function()
      assert_equal(TableUtil.tostring({1.2, 0.3, 0.3, 4.5, 6.2}), "{ 1 -> 1.2, 2 -> 0.3, 3 -> 0.3, 4 -> 4.5, 5 -> 6.2 }")
    end)

    it("converts a table within a table", function()
      assert_equal(TableUtil.tostring({{10}}), "{ 1 -> { 1 -> 10 } }")
    end)

    it("converts a function within a table to a string representation", function()
      function f()
      end
      assert_equal(TableUtil.tostring({10, f}), "{ 1 -> 10, 2 -> " .. tostring(f) .." }") 
    end)
  end)

end)

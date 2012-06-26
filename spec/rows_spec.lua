require "lib/row"
require "lib/rows"
require "lib/board"

describe("Rows", function()

  local board = Board.create({ 'x', 'o', 'x',
                               'x', 'o', 'x',
                               'o', 'x', 'o'})

  context("create", function()
    it("can be created", function()
      local rows = Rows.create(board)
      assert_not_equal(rows, nil)
      assert_equal(#(rows), 0)
    end)
  end)

  context("horizontal rows", function()
    it("returns the three horizontal rows", function()
      local rows = Rows.create(board)
      rows:horizontal()
      assert_equal(#(rows), 3)
      assert_equal(rows[1], Row.create({'x', 'o', 'x'}))
      assert_equal(rows[2], Row.create({'x', 'o', 'x'}))
      assert_equal(rows[3], Row.create({'o', 'x', 'o'}))
    end)
  end)

  context("vertical rows", function()
    it("returns the three vertical rows", function()
      local rows = Rows.create(board)
      rows:vertical()
      assert_equal(#(rows), 3)
      assert_equal(rows[1], Row.create({'x', 'x', 'o'}))
      assert_equal(rows[2], Row.create({'o', 'o', 'x'}))
      assert_equal(rows[3], Row.create({'x', 'x', 'o'}))
    end)
  end)
  
  context("diagonal rows", function()
    it("returns the two diagonal rows", function()
      local rows = Rows.create(board)
      rows:diagonal()
      assert_equal(#(rows), 2)
      assert_equal(rows[1], Row.create({'x', 'o', 'o'}))
      assert_equal(rows[2], Row.create({'x', 'o', 'o'}))
    end)
  end)

  context("all", function()
    it("returns the 8 rows (3 horizontal, 3 vertical, 2 diagonal)", function()
      local rows = Rows.create(board)
      rows:all()
      assert_equal(#(rows), 8)
    end)
  end)

end)

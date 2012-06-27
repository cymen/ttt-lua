require "lib/board"
require "lib/row"

describe("Board", function()

  context("create", function()
    it("can be created", function()
      local board = Board.create({})

      assert_not_equal(board, nil)
    end)

    it("sets the cells to nil if no value(s) provided", function()
      local board = Board.create()

      assert_not_equal(board.cells, nil)
      assert_equal(board:empty_count(), 9)
    end)

    it("accepts board cells values", function()
      local board = Board.create({'x', 'o', 'x'})

      assert_not_equal(board.cells, nil)
      assert_equal(board.cells[1], 'x')
      assert_equal(board.cells[2], 'o')
      assert_equal(board.cells[3], 'x')
      assert_equal(board:empty_count(), 6)
    end)
  end)

  context("get", function()
    it("retrieves a cell value by index", function()
      local board = Board.create({'x', 'o', 'x'})

      assert_equal(board:get(1), 'x')
      assert_equal(board:get(2), 'o')
      assert_equal(board:get(3), 'x')
      assert_equal(board:empty_count(), 6)
    end)
  end)

  context("set", function()
    it("sets a cell value by index", function()
      local board = Board.create()

      assert_equal(board:get(1), nil)
      assert_equal(board:empty_count(), 9)

      board:set(1, 'x')
      assert_equal(board:get(1), 'x')
      assert_equal(board:empty_count(), 8)
    end)
  end)

  context("clear", function()
    it("clears a cell value by index", function()
      local board = Board.create({})

      assert_equal(board:get(1), nil)
      assert_equal(board:empty_count(), 9)
      
      board:set(1, 'x')
      assert_equal(board:get(1), 'x')
      assert_equal(board:empty_count(), 8)

      board:clear(1)
      assert_equal(board:get(1), nil)
      assert_equal(board:empty_count(), 9)
    end)
  end)

  context("rows", function()
    it("returns the 8 rows", function()
      local board = Board.create()

      assert_equal(#(board:rows()), 8)
    end)
  end)

end)

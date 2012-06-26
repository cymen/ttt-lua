require "lib/board"

describe("Board", function()

  local board

  context("create", function()
    it("can be created", function()
      board = Board.create({})
      assert_not_equal(board, nil)
    end)

    it("sets the cells to nil if no value(s) provided", function()
      board = Board.create()
      assert_not_equal(board.cells, nil)
    end)

    it("accepts board cells values", function()
      board = Board.create({'x', 'o', 'x'})
      assert_not_equal(board.cells, nil)
      assert_equal(board.cells[1], 'x')
      assert_equal(board.cells[2], 'o')
      assert_equal(board.cells[3], 'x')
    end)
  end)

  context("get", function()
    it("retrieves a cell value by index", function()
      board = Board.create({'x', 'o', 'x'})
      assert_equal(board:get(1), 'x')
      assert_equal(board:get(2), 'o')
      assert_equal(board:get(3), 'x')
    end)
  end)

  context("set", function()
    it("sets a cell value by index", function()
      board = Board.create()
      assert_equal(board:get(1), nil)
      board:set(1, 'x')
      assert_equal(board:get(1), 'x')
    end)
  end)

  context("unset", function()
    it("unsets a cell value by index", function()
      board = Board.create()
      assert_equal(board:get(1), nil)
      board:set(1, 'x')
      assert_equal(board:get(1), 'x')
      board:unset(1)
      assert_equal(board:get(1), nil)
    end)
  end)
end)

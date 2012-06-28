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

    it("throws an error if attempt to set a cell that already has a value", function()
      local board = Board.create({'x'})

      function fn()
        board:set(1, 'o')
      end

      function error_handler(e)
        return e
      end

      local success, _error = xpcall(fn, error_handler)
      
      assert_equal(success, false)
      assert_not_equal(_error:find("Attempt to set cell 1 to o but it is already x"), nil)
    end)
  end)

  context("clear", function()
    it("sets a cell back to nil", function()
      local board = Board.create({'x'})

      assert_equal(board:get(1), 'x')

      board:clear(1)

      assert_equal(board:get(1), nil)
    end)
  end)


  context("rows", function()
    it("returns the 8 rows", function()
      local board = Board.create()

      assert_equal(#(board:rows()), 8)
    end)
  end)


  context("horizontal_rows", function()
    it("returns the horizontal rows", function()
      local board = Board.create({'x', nil, nil, 'o', nil, nil, nil, nil, 'x'})
      local rows = board:horizontal_rows()

      assert_equal(#(rows), 3)
      assert_equal(rows[1], Row.create({'x', nil, nil}))
      assert_equal(rows[2], Row.create({'o', nil, nil}))
      assert_equal(rows[3], Row.create({nil, nil, 'x'}))
    end)
  end)


  context("empty_cell_numbers", function()
    it("returns all cell numbers on an empty board", function()
      local board = Board.create()

      assert_equal(#(board:empty_cell_numbers()), 9)
    end)

    it("if a cell is played it is not in the empty list", function()
      local board = Board.create({'x'})

      assert_equal(#(board:empty_cell_numbers()), 8)
      for _, number in pairs(board:empty_cell_numbers()) do
        assert_not_equal(number, 1)
      end
    end)
  end)

  context("empty_count", function()
    it("sees all cells as empty on an unplayed board", function()
      local board = Board.create()

      assert_equal(board:empty_count(), 9)
    end)

    it("sees no cells as empty on a fully-played board", function()
      local board = Board.create({ 'o', 'o', 'o',
                                   'x', 'x', 'x',
                                   'o', 'o', 'o'})

      assert_equal(board:empty_count(), 0)
    end)
  end)

end)

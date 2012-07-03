require "lib/board"
require "lib/board/row"
require "spec/spec_helper"

describe("Board", function()

  context("create", function()
    it("can be created", function()
      local board = Board.create({})

      assert_not_equal(board, nil)
    end)

    it("sets the cells to nil if no value(s) provided", function()
      local board = Board.create()

      assert_not_equal(board.cells, nil)
      assert_have_same_key_value_pairs(board.cells, {})
      assert_have_same_key_value_pairs(board.cells, { nil, nil, nil,
                                                      nil, nil, nil,
                                                      nil, nil, nil })
    end)

    it("accepts board cells values", function()
      local board = Board.create({'x', 'o', 'x'})

      assert_not_equal(board.cells, nil)
      assert_have_same_key_value_pairs(board.cells, { 'x', 'o', 'x' })
      assert_have_same_key_value_pairs(board.cells, { 'x', 'o', 'x',
                                                      nil, nil, nil,
                                                      nil, nil, nil })
    end)
  end)

  context("get", function()
    it("retrieves a cell value by index", function()
      local board = Board.create({'x', 'o', 'x'})

      assert_equal(board:get(1), 'x')
      assert_equal(board:get(2), 'o')
      assert_equal(board:get(3), 'x')
    end)
  end)

  context("set", function()
    it("sets a cell value by index", function()
      local board = Board.create()

      assert_equal(board:get(1), nil)

      board:set(1, 'x')
      assert_equal(board:get(1), 'x')
    end)

    it("throws an error if attempt to set a cell that already has a value", function()
      local board = Board.create({'x'})

      assert_error(function() board:set(1, 'o') end)
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

    it("returns empty rows on an empty board", function()
      local board = Board.create()
      local rows = board:horizontal_rows()

      assert_equal(#(rows), 3)
      assert_equal(rows[1], Row.create({nil, nil, nil}))
      assert_equal(rows[2], Row.create({nil, nil, nil}))
      assert_equal(rows[3], Row.create({nil, nil, nil}))
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
      assert_have_same_key_value_pairs(board:empty_cell_numbers(), {2, 3, 4, 5, 6, 7, 8, 9})
    end)
  end)

  context("is_full", function()
    it("returns false on an empty board", function()
      local board = Board.create()

      assert_false(board:is_full())
    end)
 
    it("returns false on partially-played board", function()
      local board = Board.create({ 'o', nil, 'o',
                                   'x', nil, nil,
                                   'o', nil, 'o'})

      assert_false(board:is_full())
    end)

    it("returns true on a fully-played board", function()
      local board = Board.create({ 'o', 'o', 'o',
                                   'x', 'x', 'x',
                                   'o', 'o', 'o'})

      assert_true(board:is_full())
    end)
  end)

  context("is_empty", function()
    it("determines if board is empty", function()
      local board = Board.create()

      assert_true(board:is_empty())

      board:set(1, 'x')
      assert_false(board:is_empty())
    end)
  end)

  context("__tostring", function()
    local BoardView = require "lib/board/board_view"

    it("can return a string representation of the board", function()
      local board = Board.create({ 'o', 'o', 'o',
                                   'x', 'x', 'x',
                                   'o', 'o', 'o'})


      assert_equal(type(tostring(board)), "string")
      assert_equal(tostring(board), BoardView.render(board))
    end)
  end)

end)

require "lib/board_printer"
require "lib/board"
require "lib/output"

describe("BoardPrinter", function()

  context("create", function()
    it("can be created", function()
      local printer = BoardPrinter.create(Board.create())
      assert_not_equal(printer, nil)
    end)
  end)

  context("print", function()
    it("prints a board as three lines", function()
      local buffer = {}
      local output = Output.create(buffer)
      local board = Board.create({  'x','o','x',
                                    'o','x','o',
                                    'x','o','x'  })
      local printer = BoardPrinter.create(board, output)
      printer:print()
      assert_equal(buffer[1], 'x, o, x')
      assert_equal(buffer[2], "\n")
      assert_equal(buffer[3], 'o, x, o')
      assert_equal(buffer[4], "\n")
      assert_equal(buffer[5], 'x, o, x')
    end)
  end)

end)

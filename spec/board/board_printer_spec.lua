require "lib/board/board_printer"
require "lib/board"
require "lib/io/output"
require "spec/spec_helper"

describe("BoardPrinter", function()
  local printer

  before(function()
    printer = BoardPrinter.create()
  end)

  context("create", function()
    it("can be created", function()
      assert_not_equal(printer, nil)
    end)
  end)

  context("header_row", function()
    it("makes a header row for the board", function()
      assert_equal(printer:header_row({'x', 'o', 'x'}, 1), "1    |2    |3    ")
      assert_equal(printer:header_row({'x', 'o', 'x'}, 4), "4    |5    |6    ")
      assert_equal(printer:header_row({'x', 'o', 'x'}, 7), "7    |8    |9    ")
    end)
  end)

  context("content_row", function()
    it("makes a content row for the board", function()
      assert_equal(printer:content_row({'x', 'o', 'x'}), "  x  |  o  |  x  ")
      assert_equal(printer:content_row({'o', 'o', 'o'}), "  o  |  o  |  o  ")
    end)
  end)


  context("footer_row", function()
    it("makes a footer row for the board", function()
      assert_equal(printer:footer_row({'o', 'o', 'o'}), "_____|_____|_____")
    end)
  end)

  context("final_row", function()
    it("makes the final row for the board", function()
      assert_equal(printer:final_row({'o', 'o', 'o'}), "     |     |     ")
    end)
  end)

  context("print", function()
    it("prints a board as three lines", function()
      local buffer = {}
      local output = Output.create(buffer)
      local board = Board.create({  'x','o','x',
                                    'o','x','o',
                                    'x','o','x'  })
      local printer = BoardPrinter.create(output)

      printer:print(board)

      assert_equal(buffer[1],  "\n")
      assert_equal(buffer[2],  "                               1    |2    |3    \n")
      assert_equal(buffer[3],  "                                 x  |  o  |  x  \n")
      assert_equal(buffer[4],  "                               _____|_____|_____\n")
      assert_equal(buffer[5],  "                               4    |5    |6    \n")
      assert_equal(buffer[6],  "                                 o  |  x  |  o  \n")
      assert_equal(buffer[7],  "                               _____|_____|_____\n")
      assert_equal(buffer[8],  "                               7    |8    |9    \n")
      assert_equal(buffer[9],  "                                 x  |  o  |  x  \n")
      assert_equal(buffer[10], "                                    |     |     \n")
      assert_equal(buffer[11], "\n")
    end)
  end)

end)

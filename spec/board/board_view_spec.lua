require "lib/board"
require "spec/spec_helper"

describe("BoardView", function()
  local BoardView = require "lib/board/board_view"

  context("header_row", function()
    it("makes a header row for the board", function()
      assert_equal(BoardView.header_row({'x', 'o', 'x'}, 1), "1    |2    |3    ")
      assert_equal(BoardView.header_row({'x', 'o', 'x'}, 4), "4    |5    |6    ")
      assert_equal(BoardView.header_row({'x', 'o', 'x'}, 7), "7    |8    |9    ")
    end)
  end)

  context("content_row", function()
    it("makes a content row for the board", function()
      assert_equal(BoardView.content_row({'x', 'o', 'x'}), "  x  |  o  |  x  ")
      assert_equal(BoardView.content_row({'o', 'o', 'o'}), "  o  |  o  |  o  ")
    end)
  end)


  context("footer_row", function()
    it("makes a footer row for the board", function()
      assert_equal(BoardView.footer_row({'o', 'o', 'o'}), "_____|_____|_____")
    end)
  end)

  context("final_row", function()
    it("makes the final row for the board", function()
      assert_equal(BoardView.final_row({'o', 'o', 'o'}), "     |     |     ")
    end)
  end)

  context("render", function()
    it("makes a view of the board", function()
      local board = Board.create({  'x','o','x',
                                    'o','x','o',
                                    'x','o','x'  })

      local result = BoardView.render(board)

      assert_equal(result,  "\n"
        .. "                               1    |2    |3                                    \n"
        .. "                                 x  |  o  |  x                                  \n"
        .. "                               _____|_____|_____                                \n"
        .. "                               4    |5    |6                                    \n"
        .. "                                 o  |  x  |  o                                  \n"
        .. "                               _____|_____|_____                                \n"
        .. "                               7    |8    |9                                    \n"
        .. "                                 x  |  o  |  x                                  \n"
        .. "                                    |     |                                     \n"
        .. "\n")
    end)
  end)

end)

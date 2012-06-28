require "lib/player_next_empty"
require "lib/board"

describe("PlayerNextEmpty", function()
  local pne, board

  before(function()
    pne = PlayerNextEmpty.create()
    board = Board.create()
  end)


  context("create", function()
    it("can be created", function()
      assert_not_equal(pne, nil)
    end)
  end)

  context("play", function()
    it("plays the next empty cell", function()
      assert_equal(1, pne:play(board))
    end)
  end)

  context("get_next_empty_cell", function()
    it("chooses the first empty cell", function()
      assert_equal(1, pne:get_next_empty_cell(board))
    end)
  end)

end)

require "lib/player_next_empty"
require "lib/board"

describe("PlayerNextEmpty", function()

  context("create", function()
    it("can be created", function()
      pne = PlayerNextEmpty.create()
      assert_not_equal(pne, nil)
    end)
  end)

  context("play", function()
  end)

  context("get_next_empty_cell", function()
    it("chooses the first empty cell", function()
      board = Board.create()
      pne = PlayerNextEmpty.create()
      assert_equal(1, pne:play(board))
    end)
  end)

end)

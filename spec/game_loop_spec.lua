require "lib/game_loop"
require "lib/player_next_empty"

describe("GameLoop", function()
  local board = Board.create()
  local player_x = PlayerNextEmpty.create()
  local player_o = PlayerNextEmpty.create()

  context("create", function()
    it("can be created", function()
      loop = GameLoop.create(board, player_x, player_o)
      assert_not_equal(loop, nil)
    end)
  end)


  context("run", function()
    it("x wins with two dumb players", function()
      loop = GameLoop.create(board, player_x, player_o)
      loop:run()
      assert_equal(loop.scorer:winner(), 'x')
    end)
  end)

end)

require "lib/game_loop"
require "lib/player/player_next_empty"

describe("GameLoop", function()
  local board, player_x, player_o, loop

  before(function()
    board = Board.create()
    player_x = PlayerNextEmpty.create()
    player_o = PlayerNextEmpty.create()
    loop = GameLoop.create(board, player_x, player_o)
  end)

  context("create", function()
    it("can be created", function()
      assert_not_equal(loop, nil)
    end)
  end)


  context("run", function()
    it("x wins with two dumb players", function()
      local winner = loop:run()

      assert_equal(winner, 'x')
    end)
  end)

end)

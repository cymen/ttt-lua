require "lib/player/player_next_empty"

describe("GameLoop", function()
  local GameLoop = require "lib/game_loop"
  local board, player_x, player_o

  before(function()
    board = Board.create()
    player_x = PlayerNextEmpty.create()
    player_o = PlayerNextEmpty.create()
  end)

  context("run", function()
    it("x wins with two dumb players", function()
      local winner = GameLoop.run(board, player_x, player_o)

      assert_equal(winner, 'x')
    end)

    it("returns nil if game over and it is tied", function()
      board = Board.create({  'x', 'o', 'x',
                              'x', 'o', 'x',
                              'o', 'x', 'o' })
      local winner = GameLoop.run(board, player_x, player_o)

      assert_equal(winner, nil)
    end)
  end)

end)

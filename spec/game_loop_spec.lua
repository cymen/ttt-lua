require "lib/game_loop"
require "lib/player/player_next_empty"

describe("GameLoop", function()
  local board, player_x, player_o

  before(function()
    board = Board.create()
    player_x = PlayerNextEmpty.create()
    player_o = PlayerNextEmpty.create()
  end)

  context("create", function()
    it("can be created", function()
      local loop = GameLoop.create(board, player_x, player_o)

      assert_not_equal(loop, nil)
    end)
  end)


  context("run", function()
    it("x wins with two dumb players", function()
      local loop = GameLoop.create(board, player_x, player_o)
      local winner = loop:run()

      assert_equal(winner, 'x')
    end)

    it("returns nil if game over and it is tied", function()
      board = board:create({  'x', 'o', 'x',
                              'x', 'o', 'x',
                              'o', 'x', 'o' })
      local loop = GameLoop.create(board, player_x, player_o)

      local winer = loop:run()

      assert_equal(winner, nil)
    end)
  end)

end)

require "lib/scorer"

GameLoop = {}
GameLoop.__index = GameLoop

function GameLoop.create(board, player_x, player_o)
  local loop = {}
  setmetatable(loop, GameLoop)
  loop.scorer = Scorer.create(board)
  loop.board = board
  loop.player_x = player_x
  loop.player_o = player_o
  return loop
end

function GameLoop:run()
  while not self.scorer:is_over() do
    if self.scorer:turn() == 'x' then
      local choice = self.player_x:play(self.board)
      self.board:set(choice, 'x')
    else
      local choice = self.player_o:play(self.board)
      self.board:set(choice, 'o')
    end
  end
  return self.scorer:winner()
end

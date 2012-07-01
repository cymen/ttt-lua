local Scorer = require "/lib/scorer"

GameLoop = {}
GameLoop.__index = GameLoop

function GameLoop.create(board, player_x, player_o)
  local loop = {}
  setmetatable(loop, GameLoop)
  loop.board = board
  loop.player_x = player_x
  loop.player_o = player_o
  return loop
end

function GameLoop:run()
  while not Scorer.is_over(self.board) do
    if Scorer.turn(self.board) == 'x' then
      local choice = self.player_x:play(self.board)
      self.board:set(choice, 'x')
    else
      local choice = self.player_o:play(self.board)
      self.board:set(choice, 'o')
    end
  end
  return Scorer.winner(self.board)
end

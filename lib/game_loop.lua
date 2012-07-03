local Scorer = require "/lib/scorer"

local GameLoop = {}

function GameLoop.run(board, player_x, player_o)
  while not Scorer.is_over(board) do
    if Scorer.turn(board) == 'x' then
      local choice = player_x:play(board)
      board:set(choice, 'x')
    else
      local choice = player_o:play(board)
      board:set(choice, 'o')
    end
  end
  return Scorer.winner(board)
end

return GameLoop

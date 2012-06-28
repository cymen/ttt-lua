require "lib/player_next_empty"

Negamax = {}
Negamax.__index = Negamax

function Negamax.create()
  local negamax = {}
  setmetatable(negamax, Negamax)
  negamax.infinity = math.huge
  return negamax
end

function Negamax:run(board)
  local pne = PlayerNextEmpty.create()
  return pne:play(board)
end

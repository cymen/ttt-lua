require "lib/negamax"

PlayerComputer = {}
PlayerComputer.__index = PlayerComputer

function PlayerComputer:create()
  local pc = {}
  setmetatable(pc, PlayerComputer)
  return pc
end

function PlayerComputer:play(board)
  local negamax = Negamax.create()
  return negamax:run(board)
end

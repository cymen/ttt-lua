local Negamax = require "lib/player/negamax"

PlayerComputer = {}
PlayerComputer.__index = PlayerComputer

function PlayerComputer:create()
  local pc = {}
  setmetatable(pc, PlayerComputer)
  pc.optimal = {1, 3, 5, 7, 9}
  pc:prepare_random_value_generator()
  return pc
end

function PlayerComputer:play(board)
  local best_choices

  if board:is_empty() then
    best_choices = self.optimal
  else
    local choices = Negamax.run(board)
    best_choices = self:best_choices(choices)
  end

  return self:random_value_from_table(best_choices)
end

function PlayerComputer:max_value_from_table(choices)
  local max = -math.huge
  for _, value in pairs(choices) do
    if value > max then
      max = value
    end
  end

  return max
end

function PlayerComputer:best_choices(choices)
  local best_choices = {}
  local best_weight = self:max_value_from_table(choices)

  for cell_number, weight in pairs(choices) do
    if weight == best_weight then
      table.insert(best_choices, cell_number)
    end
  end

  return best_choices
end

function PlayerComputer:random_value_from_table(choices)
  return choices[math.random(#(choices))]
end

function PlayerComputer:prepare_random_value_generator()
  math.randomseed(os.time())
  for i=1,math.random(42) do
    math.random()
  end
end

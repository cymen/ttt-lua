local Scorer = require "/lib/scorer"

Negamax = {}
Negamax.__index = Negamax

function Negamax.create()
  local negamax = {}
  setmetatable(negamax, Negamax)
  return negamax
end

function Negamax:run(board)
  self.initial_player = Scorer.turn(board)
  self.used_count_at_start = board:used_count()
  local weighted_choices = {}

  for _, cell_number in pairs(board:empty_cell_numbers()) do
    board:set(cell_number, Scorer.turn(board))
    weighted_choices[cell_number] = -self:negamax(board, 1, -math.huge, math.huge, -1)
    board:clear(cell_number)
  end

  return weighted_choices
end

function Negamax:negamax(board, depth, alpha, beta, sign)
  if depth > 8 then
    return alpha
  end

  if Scorer.is_over(board) then
    return sign * self:analysis(board, depth)
  end

  local max = -math.huge

  local choices = board:empty_cell_numbers()
  self:sort_choices_optimally(choices)
  for _, cell_number in pairs(choices) do
    board:set(cell_number, Scorer.turn(board))
    max = math.max(-self:negamax(board, depth + 1, -beta, -alpha, -sign), max)
    board:clear(cell_number)
    alpha = math.max(alpha, max)
    if alpha >= beta then
      return alpha
    end
  end

  return max
end

function Negamax:analysis(board, depth)
  if Scorer.is_won(board) then
    if Scorer.winner(board) == self.initial_player then
      return math.pow(2, -depth)
    else
      return -math.pow(2, -depth)
    end
  elseif Scorer.is_tie(board) then
    return 0
  end
end

function Negamax:is_optimal(cell_number)
  if cell_number ~= nil and cell_number % 2 == 1 then
    return true
  else
    return false
  end
end

function Negamax:compare_optimal(a, b) --a_less_optimal_than_b(a, b)
  if self:is_optimal(a) and self:is_optimal(b) then
    return a < b
  elseif self:is_optimal(a) then
    return true
  elseif self:is_optimal(b) then
    return false
  else
    return a < b
  end
end

function Negamax:sort_choices_optimally(choices)
  function compare(a, b)
    return self:compare_optimal(a, b)
  end

  table.sort(choices, compare)
end

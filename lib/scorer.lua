require "lib/board"
require "lib/row"

Scorer = {}
Scorer.__index = Scorer

function Scorer.create(board)
  local scorer = {}
  setmetatable(scorer, Scorer)
  scorer.board = board
  return scorer
end

function Scorer:turn()
  local x_count = 0
  local o_count = 0

  for _, value in pairs(self.board.cells) do
    if value == 'x' then
      x_count = x_count + 1
    elseif value == 'o' then
      o_count = o_count + 1
    end
  end

  if x_count == o_count then
    return 'x'
  else
    return 'o'
  end
end

function Scorer:is_tie()
  return self.board:empty_count() == 0
end

function Scorer:is_won()
  for key, row in pairs(self.board:rows()) do
    if row:identical_values_and_not_nil() then
      return true
    end
  end

  return false
end

function Scorer:is_over()
  return self:is_tie() or self:is_won()
end

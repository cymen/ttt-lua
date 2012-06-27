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

require "lib/board"
require "lib/row"

local Scorer = {}

function Scorer.turn(board)
  local x_count = 0
  local o_count = 0

  for _, value in pairs(board.cells) do
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

function Scorer.is_tie(board)
  return board:empty_count() == 0
end

function Scorer.winner(board)
  for key, row in pairs(board:rows()) do
    if row:identical_values_and_not_nil() then
      return row[1]
    end
  end

  return nil
end

function Scorer.is_won(board)
  local winner = Scorer.winner(board)
  if winner ~= nil then
    return true
  else
    return false
  end
end

function Scorer.is_over(board)
  return Scorer.is_tie(board) or Scorer.is_won(board)
end

return Scorer

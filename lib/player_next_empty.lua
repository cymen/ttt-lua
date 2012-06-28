PlayerNextEmpty = {}
PlayerNextEmpty.__index = PlayerNextEmpty

function PlayerNextEmpty.create()
  local pne = {}
  setmetatable(pne, PlayerNextEmpty)
  return pne
end

function PlayerNextEmpty:play(board)
  return self:get_next_empty_cell(board)
end

function PlayerNextEmpty:get_next_empty_cell(board)
  local empty = board:empty_cell_numbers()
  return empty[1]
end

require "lib/rows"

Board = {}
Board.__index = Board

function Board.create(cells)
  local board = {}
  setmetatable(board, Board)
  board.cells = cells
  if( board.cells == nil )
    then board.cells = {}
  end
  board.side_length = 3
  return board
end

function Board:get(index)
  return self.cells[index]
end

function Board:set(index, value)
  table.insert(self.cells, index, value)
end

function Board:clear(index)
  self:set(index, nil)
end

function Board:rows()
  return Rows.create(self)
end

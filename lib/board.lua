require "lib/row"

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
  rows = {}
  table.insert(rows, 1, Row.create({self:get(1), self:get(2), self:get(3)}))
  table.insert(rows, 2, Row.create({self:get(4), self:get(5), self:get(6)}))
  table.insert(rows, 3, Row.create({self:get(7), self:get(8), self:get(9)}))
  return rows
end

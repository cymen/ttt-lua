require "lib/constants"
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
  return board
end

function Board:get(index)
  return self.cells[index]
end

function Board:set(index, value)
  self.cells[index] = value
end

function Board:clear(index)
  self:set(index, nil)
end

function Board:rows()
  local rows = Rows.create()
  rows:all(self)
  return rows
end

function Board:horizontal_rows()
  local rows = Rows.create()
  rows:horizontal(self)
  return rows
end

function Board:empty_count()
  local count = 0
  for i = 1,CELL_COUNT do
    if self.cells[i] == nil then
      count = count + 1
    end
  end
  return count
end

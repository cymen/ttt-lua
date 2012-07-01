require "lib/board/rows"

Board = {}
Board.__index = Board
Board.CELL_COUNT = 9

function Board.create(cells)
  local board = {}
  setmetatable(board, Board)
  board.cells = cells
  if cells == nil then
    cells = {}
  end
  board.cells = cells
  return board
end

function Board:get(index)
  return self.cells[index]
end

function Board:set(index, value)
  if self.cells[index] ~= nil then
    error("Attempt to set cell " .. index .. " to " .. value .. " but it is already " .. self.cells[index])
  end
  self.cells[index] = value
end


function Board:clear(index)
  self.cells[index] = nil
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

function Board:empty_cell_numbers()
  local numbers = {}

  for i = 1,self.CELL_COUNT do
    if self.cells[i] == nil then
      table.insert(numbers, i)
    end
  end

  return numbers
end

function Board:empty_count()
  return #(self:empty_cell_numbers())
end

function Board:used_count()
  return self.CELL_COUNT - self:empty_count()
end

function Board:is_empty()
  return #(self:empty_cell_numbers()) == self.CELL_COUNT 
end

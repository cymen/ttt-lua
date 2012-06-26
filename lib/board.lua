Board = {}
Board.__index = Board

function Board.create()
  local board = {}
  setmetatable(board, Board)
  return board
end

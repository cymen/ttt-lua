require "lib/row"

Rows = {}
Rows.__index = Rows

function Rows.create(board)
  local rows = {}
  setmetatable(rows, Rows)
  rows.board = board
  return rows
end

function Rows:horizontal()
  local board = self.board
  table.insert(self, Row.create({board:get(1), board:get(2), board:get(3)}))
  table.insert(self, Row.create({board:get(4), board:get(5), board:get(6)}))
  table.insert(self, Row.create({board:get(7), board:get(8), board:get(9)}))
end

function Rows:vertical()
  local board = self.board
  table.insert(self, Row.create({board:get(1), board:get(4), board:get(7)}))
  table.insert(self, Row.create({board:get(2), board:get(5), board:get(8)}))
  table.insert(self, Row.create({board:get(3), board:get(6), board:get(9)}))
end

function Rows:diagonal()
  local board = self.board
  table.insert(self, Row.create({board:get(1), board:get(5), board:get(9)}))
  table.insert(self, Row.create({board:get(3), board:get(5), board:get(7)}))
end

function Rows:all()
  self:horizontal()
  self:vertical()
  self:diagonal()
end

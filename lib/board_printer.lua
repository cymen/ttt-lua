require "lib/board"
require "lib/output"

BoardPrinter = {}
BoardPrinter.__index = BoardPrinter

function BoardPrinter.create(board, output)
  local printer = {}
  setmetatable(printer, BoardPrinter)
  printer.board = board
  if output == nil then
    printer.output = Output.create()
  else
    printer.output = output
  end
  return printer
end

function BoardPrinter:print()
  local rows = self.board:horizontal_rows()
  for _, row in pairs(rows) do
    self.output:write(row:__tostring(), "\n")
  end
end

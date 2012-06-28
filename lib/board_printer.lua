require "lib/board"
require "lib/output"

BoardPrinter = {}
BoardPrinter.__index = BoardPrinter

function BoardPrinter.create(output)
  local printer = {}
  setmetatable(printer, BoardPrinter)
  if output == nil then
    printer.output = Output.create()
  else
    printer.output = output
  end
  return printer
end

function BoardPrinter:print(board)
  local rows = board:horizontal_rows()
  for _, row in pairs(rows) do
    self.output:write(row:__tostring(), "\n")
  end
end

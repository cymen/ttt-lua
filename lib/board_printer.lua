require "lib/board"
require "lib/io/output"

BoardPrinter = {}
BoardPrinter.__index = BoardPrinter

function BoardPrinter.create(output)
  local printer = {}
  setmetatable(printer, BoardPrinter)
  if output == nil then
    output = Output.create()
  end
  printer.output = output
  return printer
end

function BoardPrinter:print(board)
  local rows = board:horizontal_rows()
  for _, row in pairs(rows) do
    self.output:write(tostring(row) .. "\n")
  end
end

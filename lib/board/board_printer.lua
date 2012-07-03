require "lib/board"
require "lib/io/output"

local StringUtil = require("lib/util/string_util")

BoardPrinter = {}
BoardPrinter.Cell_Width = 5
BoardPrinter.HorizontalSeperator = "|"
BoardPrinter.VerticalSeperator = "_"

function BoardPrinter:header_row(row, start)
  local _string = ""

  for number, _ in pairs(row) do
    local label = start + (number - 1)
    _string = _string .. StringUtil.ljust(label, self.Cell_Width)
    if number ~= #(row) then
      _string = _string .. self.HorizontalSeperator
    end
  end

  return _string
end

function BoardPrinter:content_row(row)
  local _string = ""

  for number, content in pairs(row) do
    _string = _string .. StringUtil.center(content, self.Cell_Width)
    if number ~= #(row) then
      _string = _string .. self.HorizontalSeperator
    end
  end

  return _string
end

function BoardPrinter:footer_row(row)
  local _string = ""
  
  for number, _ in pairs(row) do
    _string = _string .. string.rep(self.VerticalSeperator, self.Cell_Width)
    if number ~= #(row) then
      _string = _string .. self.HorizontalSeperator
    end
  end

  return _string
end

function BoardPrinter:final_row(row)
  local _string = ""
  
  for number, _ in pairs(row) do
    _string = _string .. string.rep(" ", self.Cell_Width)
    if number ~= #(row) then
      _string = _string .. self.HorizontalSeperator
    end
  end

  return _string
end

function BoardPrinter:print(board, output)
  if output == nil then
    output = Output.create()
  end
  
  output:write("\n")

  local rows = board:horizontal_rows()
  local row_count = #(rows)

  for number, row in pairs(rows) do
    row = row:to_printable()
    local start = (number * #(row)) + 1 - #(row)
    output:write_line_centered(self:header_row(row, start))
    output:write_line_centered(self:content_row(row))
    if number ~= #(row) then
      output:write_line_centered(self:footer_row(row))
    else
      output:write_line_centered(self:final_row(row))
    end
  end

  output:write("\n")
end

return BoardPrinter

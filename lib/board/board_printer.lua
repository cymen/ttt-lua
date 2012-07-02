require "lib/board"
require "lib/io/output"

local StringUtil = require("lib/util/string_util")

BoardPrinter = {}
BoardPrinter.__index = BoardPrinter
BoardPrinter.Cell_Width = 5
BoardPrinter.HorizontalSeperator = "|"
BoardPrinter.VerticalSeperator = "_"

function BoardPrinter.create(output)
  local printer = {}
  setmetatable(printer, BoardPrinter)
  if output == nil then
    output = Output.create()
  end
  printer.output = output
  return printer
end

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

function BoardPrinter:write(value)
  self.output:write_line_centered(value)
end

function BoardPrinter:print(board)
  self.output:write("\n")
  local rows = board:horizontal_rows()
  local row_count = #(rows)
  for number, row in pairs(rows) do
    row = row:to_printable()
    local start = (number * #(row)) + 1 - #(row)
    self:write(self:header_row(row, start))
    self:write(self:content_row(row))
    if number ~= #(row) then
      self:write(self:footer_row(row))
    else
      self:write(self:final_row(row))
    end
  end
  self.output:write("\n")
end

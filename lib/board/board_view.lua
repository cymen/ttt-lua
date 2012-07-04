local StringUtil = require("lib/util/string_util")
local TableUtil = require("lib/util/table_util")

local BoardView = {}
BoardView.Width = 80
BoardView.Cell_Width = 5
BoardView.HorizontalSeperator = "|"
BoardView.VerticalSeperator = "_"

function BoardView.header_row(row, start)
  local _string = ""

  for number, _ in pairs(row) do
    local label = start + (number - 1)
    _string = _string .. StringUtil.ljust(label, BoardView.Cell_Width)
    if number ~= #(row) then
      _string = _string .. BoardView.HorizontalSeperator
    end
  end

  return _string
end

function BoardView.content_row(row)
  local _string = ""

  for number, content in pairs(row) do
    _string = _string .. StringUtil.center(content, BoardView.Cell_Width)
    if number ~= #(row) then
      _string = _string .. BoardView.HorizontalSeperator
    end
  end

  return _string
end

function BoardView.footer_row(row)
  local _string = ""
  
  for number, _ in pairs(row) do
    _string = _string .. string.rep(BoardView.VerticalSeperator, BoardView.Cell_Width)
    if number ~= #(row) then
      _string = _string .. BoardView.HorizontalSeperator
    end
  end

  return _string
end

function BoardView.final_row(row)
  local _string = ""
  
  for number, _ in pairs(row) do
    _string = _string .. string.rep(" ", BoardView.Cell_Width)
    if number ~= #(row) then
      _string = _string .. BoardView.HorizontalSeperator
    end
  end

  return _string
end

function BoardView.render(board)
  local _string = "\n"

  local rows = board:horizontal_rows()
  local row_count = #(rows)

  for number, row in pairs(rows) do
    row = row:to_printable()
    local start = (number * #(row)) + 1 - #(row)
    _string = _string .. StringUtil.center(BoardView.header_row(row, start), BoardView.Width) .. "\n"
    _string = _string .. StringUtil.center(BoardView.content_row(row), BoardView.Width) .. "\n"
    if number ~= #(row) then
      _string = _string .. StringUtil.center(BoardView.footer_row(row), BoardView.Width) .. "\n"
    else
      _string = _string .. StringUtil.center(BoardView.final_row(row), BoardView.Width) .. "\n"
    end
  end

  _string = _string .. "\n"

  return _string
end

return BoardView

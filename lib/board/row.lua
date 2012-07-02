Row = {}
Row.__index = Row
Row.SIDE_LENGTH = 3

function Row.create(contents)
  if contents == nil then
    contents = {}
  end
  local row = contents
  setmetatable(row, Row)
  return row
end

function Row:identical_values_and_not_nil()
  local temp = self[1]
  if temp == nil then
    return false
  end

  for i = 1, self.SIDE_LENGTH do
    if self[i] ~= temp then
      return false
    end
  end

  return true
end

function Row:to_printable()
  local printable = {}

  for i = 1, self.SIDE_LENGTH do
    if self[i] == nil then
      table.insert(printable, "")
    else
      table.insert(printable, self[i])
    end
  end

  return printable
end

function Row:__eq(other)
  for key, value in pairs(self) do
    if other[key] ~= value
      then return false
    end
  end
  return true
end

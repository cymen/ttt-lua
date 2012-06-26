Row = {}
Row.__index = Row

function Row.create(contents)
  local row = contents
  setmetatable(row, Row)
  return row
end

function Row:__eq(other)
  for key, value in pairs(self) do
    if other[key] ~= value
      then return false
    end
  end
  return true
end

function Row:__tostring()
  return table.concat(self, ", ")
end

Row = {}
Row.__index = Row

function Row.create(contents)
  local row = contents
  setmetatable(row, Row)
  return row
end

function Row:identical_values_and_not_nil()
  local temp = self[1]
  if temp == nil then
    return false
  end

  for i = 1,3 do
    if self[i] ~= temp then
      return false
    end
  end

  return true
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
  local output = {}
  for i = 1,3 do
    if self[i] == nil then
      output[i] = "_"
    else
      output[i] = self[i]
    end
  end
  return table.concat(output, ", ")
end

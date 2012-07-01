local TableUtil = {}

function TableUtil.equal(table_a, table_b)
  return TableUtil.table1_within_table2(table_a, table_b)
    and TableUtil.table1_within_table2(table_b, table_a)
end

function TableUtil.max(_table)
  local max
  for key, value in pairs(_table) do
    if type(value) ~= "number" then
      error("unexpected " .. type(value) .. ": " .. value)
    end
    if max == nil or max < value then
      max = value
    end
  end
  return max
end

function TableUtil.table1_within_table2(table1, table2)
  for key, value in pairs(table1) do
    if table2[key] ~= table1[key] then
      if type(table2[key]) == 'table' and type(table1[key]) == 'table' then
        if not TableUtil.equal(table2[key], table1[key]) then
          return false
        end
      else
        return false
      end
    end
  end

  return true
end

function TableUtil.tostring(_table)
  local _string = ""
  local count = 0

  for key, value in pairs(_table) do
    if count > 0 then
      _string = _string .. ","
    end
    _string = _string .. " " .. key .. " -> "

    if type(value) == "string" then
      _string = _string .. "'" .. value .. "'"
    elseif type(value) == "table" then
      _string = _string .. TableUtil.tostring(value)
    else
      _string = _string .. value
    end
    
    count = count + 1
  end

  return "{" .. _string .. " }"
end

return TableUtil

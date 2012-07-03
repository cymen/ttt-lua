Output = {}
Output.__index = Output
Output.DefaultWidth = 80

function Output.create(buffer, width)
  local output = {}
  setmetatable(output, Output)
  output.buffer = buffer
  if width == nil then
    width = Output.DefaultWidth
  end
  output.width = width
  return output
end

function Output:write(value)
  if type(value) ~= 'string' then
    value = tostring(value)
  end

  if self.buffer ~= nil then
    table.insert(self.buffer, value)
  else
    io.write(value)
  end
end

function Output:write_line_centered(value, width)
  if width == nil then
    width = Output.DefaultWidth
  end

  if type(value) ~= 'string' then
    value = tostring(value)
  end

  local length, padding
  length = #(value)
  padding = (width - length) / 2

  self:write(string.rep(" ", padding) .. value .. '\n')
end

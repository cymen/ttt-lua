Output = {}
Output.__index = Output

function Output.create(buffer, width)
  local output = {}
  setmetatable(output, Output)
  output.buffer = buffer
  if width == nil then
    width = 80
  end
  output.width = width
  return output
end

function Output:write(value)
  if self.buffer ~= nil then
    table.insert(self.buffer, value)
  else
    io.write(value)
  end
end

function Output:write_line_centered(value, width)
  if width == nil then
    width = self.width
  end

  local length, padding
  length = #(value)
  padding = (width - length) / 2

  self:write(string.rep(" ", padding) .. value .. '\n')
end

Output = {}
Output.__index = Output

function Output.create(buffer)
  local output = {}
  setmetatable(output, Output)
  output.buffer = buffer
  return output
end

function Output:write(...)
  for _, value in ipairs(arg) do
    if self.buffer then
      table.insert(self.buffer, value)
    else
      io.write(value)
    end
  end
end

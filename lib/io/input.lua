Input = {}
Input.__index = Input

function Input.create(buffer)
  local input = {}
  setmetatable(input, Input)
  input.buffer = buffer
  input.buffer_index = 1
  return input
end

function Input:read_line()
  if self.buffer then
    local read = self.buffer[self.buffer_index]
    self.buffer_index = self.buffer_index + 1
    return read
  else
    return io.read("*line")
  end
end

function Input:read_number()
  if self.buffer then
    return self.buffer[#(self.buffer)]
  else
    return io.read("*number")
  end
end

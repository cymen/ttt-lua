Output = {}
Output.__index = Output
Output.DefaultWidth = 80

local StringUtil = require "lib/util/string_util"

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

  self:write(StringUtil.center(value, width) .. "\n")
end

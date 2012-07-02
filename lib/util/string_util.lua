local StringUtil = {}

function StringUtil.center(_string, width)
  if type(_string) ~= 'string' then
    _string = tostring(_string)
  end

  local pad_left = string.rep(" ", math.floor((width - #(_string))/2))
  local pad_right = string.rep(" ", math.ceil((width - #(_string))/2))
  
  return pad_left .. _string .. pad_right
end

function StringUtil.ljust(_string, length)
  if type(_string) ~= 'string' then
    _string = tostring(_string)
  end
  
  local pad_right = string.rep(" ", math.floor(length - #(_string)))

  return _string .. pad_right
end

return StringUtil

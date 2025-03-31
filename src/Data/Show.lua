return {
  showIntImpl = (function(n) return tostring(n) end),
  showNumberImpl = (function(n)
    -- For consistency (and passing the existing tests),
    -- this attempts to display similarly to the JS backend.
    if n ~= n then
      return "NaN"
    elseif n == math.huge then
      return "Infinity"
    elseif n == -math.huge then
      return "-Infinity"
    else
      return tostring(n)
    end
  end),
  showCharImpl = (function(n)
    local code = n:byte()
    if code < 0x20 or code == 0x7F then
      if n == "\x07" then return "'\\a'" end
      if n == "\b" then return "'\\b'" end
      if n == "\f" then return "'\\f'" end
      if n == "\n" then return "'\\n'" end
      if n == "\r" then return "'\\r'" end
      if n == "\t" then return "'\\t'" end
      if n == "\v" then return "'\\v'" end
      return "'\\" .. code:toString(10) .. "'"
    end
    if n == "'" or n == "\\" then return "'\\" .. n .. "'" end
    return "'" .. n .. "'"
  end),
  showStringImpl = (function(s) return s end),
  showArrayImpl = (function(f)
    return function(xs)
      local l = #xs
      local ss = {}
      for i = 1, l do ss[i] = f(xs[i - 1]) end
      return "[" .. table.concat(ss, ",") .. "]"
    end
  end)
}

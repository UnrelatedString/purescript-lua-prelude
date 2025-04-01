return {
  concatString = (function(s1) return function(s2) return s1 .. s2 end end),
  concatArray = (function(xs)
    return function(ys)
      if #xs == 0 then return ys end
      local r = xs
      for i, v in pairs(ys) do
        r[#xs+i] = v
      end
      return r
    end
  end)
}

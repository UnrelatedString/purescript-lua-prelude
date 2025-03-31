return {
  testNumberShow = (function(showNumber)
    return function()
      local cases = {
        {0.0, "0.0"},
        {1.0, "1.0"},
        {-1.0, "-1.0"},
        {500.0, "500.0"},
  
        -- Outside Int range
        {1e10, "10000000000.0"},
        {1e10 + 0.5, "10000000000.5"},
        {-1e10, "-10000000000.0"},
        {-1e10 - 0.5, "-10000000000.5"},
  
        -- With exponent
        {1e21, "1e+21"},
        {1e-21, "1e-21"},
  
        -- With decimal and exponent
        {1.5e21, "1.5e+21"},
        {1.5e-10, "1.5e-10"},
  
        {0/0, "NaN"},
        {math.huge, "Infinity"},
        {-math.huge, "-Infinity"},
      }
      
      for i, case in pairs(cases) do
        local input = case[1]
        local expected = case[2]
        local actual = showNumber(input)
        if expected ~= actual then
          error("For "..input..", expected "..expected..", got: "..actual..".")
        end
      end
    end
  end)
}

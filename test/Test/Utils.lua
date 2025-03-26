return {
  throwErr = (function(msg)
    return function()
      error(msg)
    end
  end),
}

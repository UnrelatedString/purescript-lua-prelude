return {
  throwErr = (function(msg)
    print("un-run Effect to throw: ", msg)
    return function()
      error(msg)
    end
  end),
}

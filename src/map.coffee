exports.create = (options = {}) ->
  options.w ?= 80
  options.h ?= 60
  maxRooms = options.w * options.h / 500
  options.rooms ?= Math.floor(Math.random() * Math.floor(maxRooms)) + 1
  m = []
  for x in [0..options.w]
    m[x] = []
    for y in [0..options.h]
      m[x][y] = if x in [0,options.w] or 
                   y in [0,options.h] 
                   then 1 else 0  
  options.map ?= m
  return options

exports.create = (options = {}) ->
  r = (n) ->
    return Math.floor(Math.random() * Math.floor(n))
  options.w ?= 80
  options.h ?= 60
  maxRooms = options.w * options.h / 500
  options.rooms ?= r(maxRooms) + 3 
  m = []
  for x in [0..options.w]
    m[x] = []
    for y in [0..options.h]
      m[x][y] = if x in [0,options.w] or
                   y in [0,options.h]
                   then 1 else 0
  for i in [0..options.rooms]
    w = r options.w / maxRooms
    #console.log w
    h = r options.h / maxRooms
    x = r options.w
    if x + w > options.w then w = options.w - x
    if y + h > options.h then h = options.h - y
    y = r options.h
    for j in [0..w]
      for k in [0..h]
        m[j+x][y+k] = 2
    
  options.map ?= m
  return options

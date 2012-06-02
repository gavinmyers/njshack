exports.create = (options = {}) ->
  r = (n, v = 0) ->
    return Math.floor(Math.random() * Math.floor(n)) + v
  options.w ?= 80
  options.h ?= 60
  maxRooms = options.w * options.h / 500
  options.rooms ?= r maxRooms, 3
  m = []
  for x in [0..options.w]
    m[x] = []
    for y in [0..options.h]
      m[x][y] = if x in [0,options.w] or
                   y in [0,options.h]
                   then 0 else 1
  for i in [0..options.rooms]
    w = r options.w / maxRooms, 3
    h = r options.h / maxRooms, 3
    x = r options.w - 4
    y = r options.h - 4
    for j in [0..w]
      for k in [0..h]
        if m[j+x] and m[j+x][y+k] then m[j+x][y+k] = 2
  options.map ?= m
  return options

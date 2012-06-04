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
  #REDO
  for i in [0..options.rooms]
    w = r options.w / maxRooms, 3
    h = r options.h / maxRooms, 3
    x = r options.w
    y = r options.h
    if x+w > options.w then w = 3
    if y+h > options.h then h = 3
    if x+4 > options.w then x = x - 4
    if y+4 > options.h then y = y - 4
    x ?= 1
    y ?= 1
    for j in [1..w]
      for k in [1..h]
        if 1 == m[j+x][y+k]
          m[j+x][y+k] = 2
    if i == 0 then m[r w,x][r h,y] = 3
    if i == options.rooms then m[r w,x][r h,y] = 4
  options.map ?= m
  return options

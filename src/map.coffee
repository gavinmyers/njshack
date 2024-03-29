r = (n, v = 0) ->
  return Math.floor(Math.random() * Math.floor(n)) + v

exports.defaultW = 80
exports.defaultH = 60

exports.defaultRoomCalc = (width, height) ->
  mr = width * height
  mr = mr * 0.01
  mr = r mr,3
  return mr

exports.defaultAreaCalc ?= (width,height,rooms) ->
  m = []
  for x in [0..width]
    m[x] = []
    for y in [0..height]
      m[x][y] = if x in [0,width] or
                   y in [0,height]
                   then 0 else 1
  for i in [1..rooms]
    w = r width, 3
    h = r height, 3
    x = r width
    y = r height
    if x+w > width then w = 3
    if y+h > height then h = 3
    if x+4 > width then x = x - 4
    if y+4 > height then y = y - 4
    x ?= 1
    y ?= 1
    for j in [1..w]
      for k in [1..h]
        if 1 == m[j+x][y+k]
          m[j+x][y+k] = 2
    if i == 1 then m[r w,x][r h,y] = 3
    if i == rooms then m[r w,x][r h,y] = 4
  return m

exports.create = (opt = {}) ->
  opt.roomCalc ?= exports.defaultRoomCalc
  opt.areaCalc ?= exports.defaultAreaCalc
  opt.w ?= exports.defaultW
  opt.h ?= exports.defaultH
  opt.rooms ?= opt.roomCalc opt.w, opt.h
  opt.map ?= opt.areaCalc opt.w, opt.h, opt.rooms
  return opt

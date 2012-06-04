exports.create = (opt = {}) ->
  opt.w ?= 80
  opt.h ?= 60
  opt.calc ?= []
  
  opt.calc.room ?= (width,height) ->
    mr = width * height
    mr = mr * 0.08
    return mr

  opt.calc.area ?= (width,height,rooms) ->
    r = (n, v = 0) ->
      return Math.floor Math.random() * Math.floor n + v
    m = []
    for x in [0..width]
      m[x] = []
      for y in [0..height]
        m[x][y] = if x in [0,width] or
                     y in [0,height]
                     then 0 else 1
    for i in [0..rooms]
      w = r width / rooms, 3
      h = r height / opt.rooms, 3
      x = r width
      y = r height
      if x+w > width then w = 3
      if y+h > height then h = 3
      if x+4 > width then x = x - 4
      if y+4 > height then y = y - 4
      x ?= 1
      y ?= 1
      for j in [0..w]
        for k in [0..h]
          if 1 == m[j+x][y+k]
            m[j+x][y+k] = 2
      if i == 0 then m[r w,x][r h,y] = 3
      if i == rooms then m[r w,x][r h,y] = 4
    return m
  
  opt.rooms ?= opt.calc.room opt.w, opt.h
  opt.map ?= opt.calc.area opt.w, opt.h, opt.rooms
  return opt

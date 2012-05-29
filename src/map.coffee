exports.create = (options = {}) ->
  options.w ?= 80
  options.h ?= 60
  maxRooms = options.w * options.h / 500
  options.rooms ?= Math.floor(Math.random() * Math.floor(maxRooms)) + 1
  m = [[1,1,1,1],[1,0,0,0,1],[1,1,1,1,1]]
  options.map ?= m
  return options

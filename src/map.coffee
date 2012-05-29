exports.create = (options = {}) ->
  options.w ?= 80
  options.h ?= 60
  maxRooms = options.w * options.h / 500
  options.rooms ?= Math.floor(Math.random() * Math.floor(maxRooms)) + 1
  return options

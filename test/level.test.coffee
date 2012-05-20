process.stdout.write '\u001B[2J\u001B[0;0f'

level = require("../src/level.coffee")
if !level? or !level.create? then throw new Error "cannot find level"

map = require("../src/map.coffee")
if !map? or !map.create? then throw new Error "cannot find map"

map.create()

process.exit()


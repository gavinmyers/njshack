process.stdout.write '\u001B[2J\u001B[0;0f'

#error = (msg) ->
#  console.log '\u001B[31m' + '***************************'
#  console.log msg
#  console.log '***************************' + '\u001B[0m' 
#  throw new Error

#console.log '\u001B[40;31m' + '**********' + '\u001B[0m' 


level = require("../src/level.coffee")
if !level? or !level.create? then throw new Error "cannot find level"

map = require("../src/map.coffee")
if !map? or !map.create? then throw new Error "cannot find map"

map.create()

# console.log '\u001B[32m' + '__________________________________________________' + '\u001B[0m'
process.exit()

# res = map.create()
# console.log res.edf
# console.log level.create()


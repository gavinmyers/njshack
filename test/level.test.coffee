process.stdout.write '\u001B[2J\u001B[0;0f'
 
level = require("../src/level.coffee")
if !level? or !level.create? 
  throw new Error "cannot find level"

map = require("../src/map.coffee")
if !map? or !map.create? 
  throw new Error "cannot find map"

if map.create().w != 80
  throw new Error "default width not set"

if map.create().h != 60
  throw new Error "default height not set"

if map.create({w:120}).w != 120
  throw new Error "override width not set"

if map.create({h:80}).h != 80 
  throw new Error "override height not set"

if map.create().rooms < 1
  throw new Error "default rooms not set" 

if map.create({rooms:4}).rooms != 4
  throw new Error "override rooms not set"

m = map.create()
console.log m

process.exit()


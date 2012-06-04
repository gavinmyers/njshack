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

if map.create({w:7331}).w != 7331
  throw new Error "override width not set"

if map.create({h:1337}).h != 1337
  throw new Error "override height not set"

if map.create().rooms < 1
  throw new Error "default rooms not set"

if map.create({rooms:1024}).rooms != 1024
  throw new Error "override rooms not set"

if map.create().map[0][0] != 0
  throw new Error "default map not set"

if map.create({map:[[512]]}).map[0][0] != 512
  throw new Error "override map not set"

if map.create({calc:{room:(w,h)-> return -64}}).rooms != -64
  throw new Error "override room calc not set"

if map.create({calc:{area:(w,h,r)-> return [[42]]}}).map[0][0] != 42
  throw new Error "override area calc not set"

for i in [0..10]
  m = map.create({w:30,h:50})
  #rotate monitor 90d
  l = ""
  t = ""
  for xo,xi in m.map
    #console.log l
    l = ""
    for yo,yi in xo
      switch yo
        when 0
          l += "*"
        when 1
          l += "."
        when 2
          l += "#"
        when 3
          l += "U"
        when 4
          l += "D"
    t += l
  #console.log l
  if -1 == t.indexOf "D"
    throw new Error "no down"

  if -1 == t.indexOf "U"
    throw new Error "no up"

console.log ":)"
process.exit()


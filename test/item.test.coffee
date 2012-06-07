process.stdout.write '\u001B[2J\u001B[0;0f'
item = require "../src/item.coffee"

if !item? or !item.create?
  throw new Error "no item"


process.stdout.write '\u001B[2J\u001B[0;0f'
console.log ":)"

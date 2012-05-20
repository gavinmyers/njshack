http = require "http"
redis = require "redis"

http.createServer( (req, res) ->
  client = redis.createClient()
  res.writeHead 200, "Content-Type":"text/html"
  res.end "NETHACK"

).listen 8000

console.log 'Server running at http://127.0.0.1:8000/'

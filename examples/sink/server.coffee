express = require 'express'
sink = require './sink'
app = express.createServer(
  express.favicon(),
  express.static(__dirname + '/public')
)

store = sink.createStore listen: app
store.flush()

app.get '/', (req, res) ->
  store.subscribe 'x.**', (err, model) ->
    sink.view.sendHtml res, model

app.listen 3000
console.log 'Go to http://localhost:3000/'

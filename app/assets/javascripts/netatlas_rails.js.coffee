window.NetatlasRails =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    new NetatlasRails.Routers.Pollers()
    Backbone.history.start()

$(document).ready ->
  NetatlasRails.init()

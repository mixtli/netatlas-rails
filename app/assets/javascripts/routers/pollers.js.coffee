class NetatlasRails.Routers.Pollers extends Backbone.Router
  routes:
    'pollers': 'index'
    'pollers/:id': 'show' 

  initialize: ->
    @collection = new NetatlasRails.Collections.Pollers()
    @collection.fetch()

  index: ->
    view = new NetatlasRails.Views.PollersIndex(collection: @collection)
    $('#main').html(view.render().el)

  show: (id) ->
    alert "Poller #{id}"


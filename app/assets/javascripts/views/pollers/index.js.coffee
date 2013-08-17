class NetatlasRails.Views.PollersIndex extends Backbone.View

  template: JST['pollers/index']

  initialize: ->
    @collection.on("reset", @render, this)

  render: ->
    $(@el).html(@template(pollers: @collection))
    this

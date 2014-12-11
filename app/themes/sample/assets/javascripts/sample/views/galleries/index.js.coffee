class Views.Galleries.IndexView extends Views.ApplicationView
  render: ->
    super()
    Widgets.Gallery.enable()

  cleanup: ->
    super()
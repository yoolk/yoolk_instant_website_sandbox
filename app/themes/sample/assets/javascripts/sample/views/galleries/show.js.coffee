class Views.Galleries.ShowView extends Views.ApplicationView
  render: ->
    super()
    Widgets.Gallery.enable()

  cleanup: ->
    super()
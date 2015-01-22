class Yoolk.Views.Galleries.IndexView extends Yoolk.Views.ApplicationView
  render: ->
    super()
    Yoolk.Widgets.Gallery.enable()

  cleanup: ->
    super()
class Yoolk.Views.Galleries.ShowView extends Yoolk.Views.ApplicationView
  render: ->
    super()
    Yoolk.Widgets.Gallery.enable()
    Yoolk.Widgets.PhotoSwipe.enable(".photoswipe-gallery")

  cleanup: ->
    super()
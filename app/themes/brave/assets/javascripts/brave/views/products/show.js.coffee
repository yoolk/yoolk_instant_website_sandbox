class Yoolk.Views.Products.ShowView extends Yoolk.Views.ApplicationView
  render: ->
    super()
    Yoolk.Widgets.OwlCarousel.enable()

  cleanup: ->
    super()
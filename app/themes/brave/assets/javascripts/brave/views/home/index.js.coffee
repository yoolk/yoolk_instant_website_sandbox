class Yoolk.Views.Home.IndexView extends Yoolk.Views.ApplicationView
  render: ->
    super()
    Yoolk.Widgets.OwlCarousel.enable()
    Yoolk.Widgets.MagnificPopup.enable()

  cleanup: ->
    super()
class Yoolk.Views.AboutUs.IndexView extends Yoolk.Views.ApplicationView
  render: ->
    super()
    Yoolk.Widgets.MagnificPopup.enable()

  cleanup: ->
    super()
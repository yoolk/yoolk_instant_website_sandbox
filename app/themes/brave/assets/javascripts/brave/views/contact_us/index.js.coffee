class Yoolk.Views.ContactUs.IndexView extends Yoolk.Views.ApplicationView
  render: ->
    super()
    Yoolk.Widgets.Map.enable()

  cleanup: ->
    super()
class Yoolk.Views.ContactUs.NewView extends Yoolk.Views.ApplicationView
  render: ->
    super()
    Yoolk.Widgets.Map.enable()

  cleanup: ->
    super()
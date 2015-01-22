class Yoolk.Views.ContactUs.IndexView extends Yoolk.Views.ApplicationView
  render: ->
    super()
    Yoolk.Widgets.ContactUs.enable()

  cleanup: ->
    super()
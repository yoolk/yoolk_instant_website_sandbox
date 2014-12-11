class Views.ContactUs.IndexView extends Views.ApplicationView
  render: ->
    super()
    Widgets.ContactUs.enable()

  cleanup: ->
    super()
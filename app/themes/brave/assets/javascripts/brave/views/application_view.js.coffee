class Yoolk.Views.ApplicationView
  render: ->
    Yoolk.Widgets.ToTop.enable()
    Yoolk.Widgets.ResponsiveNav.enable()
    Yoolk.Widgets.CustomDropdown.enable()

  cleanup: ->
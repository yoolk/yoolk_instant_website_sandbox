window.Views.Map ||= {}
class Views.Map.IndexView extends Views.ApplicationView
  render: ->
    super()
    Widgets.Map.enable()

  cleanup: ->
    super()

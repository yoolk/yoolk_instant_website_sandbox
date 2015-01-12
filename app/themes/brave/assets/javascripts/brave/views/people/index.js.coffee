class Yoolk.Views.People.IndexView extends Yoolk.Views.ApplicationView
  render: ->
    super()
    Yoolk.Widgets.Masonry.enable()

  cleanup: ->
    super()
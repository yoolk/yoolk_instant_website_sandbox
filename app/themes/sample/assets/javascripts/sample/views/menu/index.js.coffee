class Yoolk.Views.Menu.IndexView extends Yoolk.Views.ApplicationView
  render: ->
    super()
    Yoolk.Widgets.CatalogBase.enable()

  cleanup: ->
    super()
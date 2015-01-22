class Yoolk.Views.Menu.Categories.ShowView extends Yoolk.Views.ApplicationView
  render: ->
    super()
    Yoolk.Widgets.CatalogBase.enable()

  cleanup: ->
    super()
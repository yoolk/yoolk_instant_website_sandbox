class Yoolk.Views.Services.IndexView extends Yoolk.Views.ApplicationView
  render: ->
    super()
    Yoolk.Widgets.CatalogBase.enable()

  cleanup: ->
    super()
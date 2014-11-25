window.Views.Galleries ||= {}
class Views.Galleries.IndexView extends Views.ApplicationView
  render: ->
    super()
    Galleries.Collage.enable()

  cleanup: ->
    super()
window.Views.Galleries ||= {}
class Views.Galleries.ShowView extends Views.ApplicationView
  render: ->
    super()
    Galleries.Collage.enable()

  cleanup: ->
    super()
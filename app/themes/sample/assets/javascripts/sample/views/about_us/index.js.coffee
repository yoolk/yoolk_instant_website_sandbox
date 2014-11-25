window.Views.AboutUs ||= {}
class Views.AboutUs.IndexView extends Views.ApplicationView
  render: ->
    super()
    $('.flexslider').flexslider()

  cleanup: ->
    super()
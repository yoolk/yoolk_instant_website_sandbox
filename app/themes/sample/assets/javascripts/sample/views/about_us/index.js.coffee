class Yoolk.Views.AboutUs.IndexView extends Yoolk.Views.ApplicationView
  render: ->
    super()
    $('.flexslider').flexslider()

  cleanup: ->
    super()
# libs
#= require jquery/v1.11.1
#= require bootstrap/v3.2.0
#= require jquery.render/v1.1.0
#= require jquery.flexslider/v2.2.2
#= require jquery.timeago/v1.4.1
#= require jquery.colorbox/v1.5.14
#= require jquery.collageplus/v0.3.3
#= require jquery.collageplus/v0.3.3/jquery.collagecaption
#= require jquery.collageplus/v0.3.3/remove_whitespace
#= require imagesloaded/v3.1.8
#= require zebra_datepicker/v1.8.9

# theme, widgets, and views
#= require theme
#= require sample/widgets/announcement
#= require sample/widgets/contact_us
#= require sample/widgets/gallery
#= require sample/widgets/map
#= require_tree ./views


pageLoad = ->
  className = $('body').attr('data-class-name')
  window.applicationView = try
    eval("new #{className}()")
  catch error
    new Views.ApplicationView()
  window.applicationView.render()

$ ->
  pageLoad()
  $(document).on 'page:load', pageLoad
  $(document).on 'page:before-change', ->
    window.applicationView.cleanup()
    true
  $(document).on 'page:restore', ->
    window.applicationView.cleanup()
    pageLoad()
    true

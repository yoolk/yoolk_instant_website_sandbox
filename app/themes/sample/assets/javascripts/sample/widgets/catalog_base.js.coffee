class Yoolk.Widgets.CatalogBase
  thiz = @
  @enable:  ->
    Yoolk.Widgets.PhotoSwipe.enable(".photoswipe-gallery")
    thiz.catalogThumbnails()
    thiz.clickCatalogThumbnails()

  @catalogThumbnails: ->
    $('.catalog-thumbnails-image img').fakecrop
      wrapperWidth: 50
      wrapperHeight: 50


  @clickCatalogThumbnails: ->
    $('.catalog-thumbnails-image').bind "click", (e) ->
      e.preventDefault()

      $(@).parent().find('.active').removeClass('active')
      $(@).children().addClass('active')

      $(@).parents( '.catalog' ).find( '.catalog-image img' ).css('display', 'none')
      $(@).parents( '.catalog' ).find( '.catalog-image a' ).eq( $(@).index() )[0].children[0].style.cssText = 'display: inline'
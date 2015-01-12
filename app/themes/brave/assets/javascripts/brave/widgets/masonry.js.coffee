class Yoolk.Widgets.Masonry
  @enable: ->
    $(window).load ->
      $('#masonry').imagesLoaded(->
          $("#masonry").masonry
            columnWidth: 0
            itemSelector: ".item"
        )
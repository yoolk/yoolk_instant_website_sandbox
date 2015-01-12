class Yoolk.Widgets.Masonry
  @enable: ->
    $('#masonry').imagesLoaded(->
        container = document.querySelector("#masonry")
        msnry = new Masonry(container,

          # options
          columnWidth: 200
          itemSelector: ".item"
        )
      )
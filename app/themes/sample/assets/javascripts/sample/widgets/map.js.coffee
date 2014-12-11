class Widgets.Map
  @enable:  ->
    initMapCanvasHeight = ->
      win_height  = $(window).height()
      $("#map-canvas").css("height", win_height - 75 )

    renderMap   = ->
      if window['google'] and window['google']['maps']
        mapCanvas  = $("#map-canvas")
        lat        = mapCanvas.data("lat")
        lng        = mapCanvas.data("long")

        latlong    = new google.maps.LatLng(lat, lng)
        options    =
          zoom: 14
          center: latlong
          scrollwheel: false
          mapTypeId: google.maps.MapTypeId.ROADMAP

        map        = new google.maps.Map(mapCanvas[0], options)

        content    = $("#tmpl-infowindow").render({}, false)
        infowindow = new google.maps.InfoWindow(
          content: content
          maxWidth: 320
        )

        marker     = new google.maps.Marker(
          map: map
          position: latlong
        )

        infowindow.open map, marker

        google.maps.event.addListener marker, "click", ->
          infowindow.open map, marker

    initMapCanvasHeight()
    renderMap()
class Yoolk.Widgets.Map
  @enable:  ->

    renderMap   = ->
      if window['google'] and window['google']['maps']
        mapDiv  = $("#map-canvas")
        lat     = mapDiv.data("lat")
        lng     = mapDiv.data("long")
        latlong = new google.maps.LatLng(lat, lng)
        myOptions =
          scrollwheel: false
          center: latlong
          zoom: 14
          mapTypeId: google.maps.MapTypeId.ROADMAP

        _map   = new google.maps.Map(mapDiv[0], myOptions)
        marker = new google.maps.Marker({
          position: latlong
          map: _map
        })

    renderMap()
class Yoolk.Widgets.ToTop
  @enable:  ->
    $(document).ready ->
      $(window).scroll ->
        if $(this).scrollTop() > 200
          $(".totop").fadeIn()
        else
          $(".totop").fadeOut()

      $(".totop a").click (e) ->
        e.preventDefault()
        $("html, body").animate
          scrollTop: 0
        , "fast"
        false
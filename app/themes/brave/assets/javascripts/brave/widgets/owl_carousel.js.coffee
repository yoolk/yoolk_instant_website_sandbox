class Yoolk.Widgets.OwlCarousel
  @enable:  ->
    $(document).ready ->

      # Owl carousel
      $(".owl-carousel").owlCarousel
        slideSpeed: 500
        rewindSpeed: 1000
        mouseDrag: true
        stopOnHover: true


      # Own navigation
      $(".owl-nav-prev").click ->
        $(this).parent().next(".owl-carousel").trigger "owl.prev"

      $(".owl-nav-next").click ->
        $(this).parent().next(".owl-carousel").trigger "owl.next"


class Yoolk.Widgets.CustomDropdown
  @enable:  ->
    $(document).ready ->
      hidden = true
      $(".b-dropdown").click (e) ->
        e.preventDefault()
        if hidden
          $(this).next(".b-dropdown-block").slideToggle 400, ->
            hidden = false


      $("html").click ->
        unless hidden
          $(".b-dropdown-block").slideUp()
          hidden = true

      $(".b-dropdown-block").click (event) ->
        event.stopPropagation()


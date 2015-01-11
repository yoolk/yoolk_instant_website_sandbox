class Yoolk.Widgets.ResponsiveNav
  @enable:  ->
    $(document).ready ->
      $.fn.menumaker = (options) ->
        cssmenu = $(this)
        settings = $.extend(
          title: "Menu"
          format: "dropdown"
          sticky: false
        , options)
        @each ->
          cssmenu.prepend "<div id=\"menu-button\">" + settings.title + "</div>"
          $(this).find("#menu-button").on "click", ->
            $(this).toggleClass "menu-opened"
            mainmenu = $(this).next("ul")
            if mainmenu.hasClass("open")
              mainmenu.slideUp().removeClass "open"
            else
              mainmenu.slideDown().addClass "open"
              mainmenu.find("ul").slideDown()  if settings.format is "dropdown"

          cssmenu.find("li ul").parent().addClass "has-sub"
          multiTg = ->
            cssmenu.find(".has-sub").prepend "<span class=\"submenu-button\"></span>"
            cssmenu.find(".submenu-button").on "click", ->
              $(this).toggleClass "submenu-opened"
              if $(this).siblings("ul").hasClass("open")
                $(this).siblings("ul").removeClass("open").slideUp()
              else
                $(this).siblings("ul").addClass("open").slideDown()


          if settings.format is "multitoggle"
            multiTg()
          else
            cssmenu.addClass "dropdown"


      $(".navy").menumaker
        title: "Menu"
        format: "multitoggle"


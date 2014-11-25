$(window).load ->
  _active_opening_hour = ->

    date = new Date()
    rows = $("tr td:nth-child(#{ date.getDay() + 1 }),
              tr th:nth-child(#{ date.getDay() + 1 })")

    rows.addClass("opening-active")

  _active_opening_hour()
window.Widgets ||= {}
class Widgets.ContactUs
  @enable:  ->
    date = new Date()
    rows = $("tr td:nth-child(#{ date.getDay() + 1 }),
              tr th:nth-child(#{ date.getDay() + 1 })")

    rows.addClass("opening-active")
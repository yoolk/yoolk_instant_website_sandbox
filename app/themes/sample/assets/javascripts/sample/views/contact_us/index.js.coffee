window.Views.ContactUs ||= {}
class Views.ContactUs.IndexView extends Views.ApplicationView
  render: ->
    super()
    date = new Date()
    rows = $("tr td:nth-child(#{ date.getDay() + 1 }),
              tr th:nth-child(#{ date.getDay() + 1 })")

    rows.addClass("opening-active")

  cleanup: ->
    super()
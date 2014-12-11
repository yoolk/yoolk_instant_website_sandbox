class Views.Reservation.IndexView extends Views.ApplicationView
  render: ->
    super()
    $('input.datepicker').Zebra_DatePicker()

  cleanup: ->
    super()
class Yoolk.Views.Reservation.IndexView extends Yoolk.Views.ApplicationView
  render: ->
    super()
    $('input.datepicker').Zebra_DatePicker()

  cleanup: ->
    super()
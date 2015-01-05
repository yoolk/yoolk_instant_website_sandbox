class Yoolk.Views.Announcements.ShowView extends Yoolk.Views.ApplicationView
  render: ->
    super()
    Yoolk.Widgets.Announcement.enable()

  cleanup: ->
    super()
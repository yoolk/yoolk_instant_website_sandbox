class Yoolk.Views.Announcements.IndexView extends Yoolk.Views.ApplicationView
  render: ->
    super()
    Yoolk.Widgets.Announcement.enable()

  cleanup: ->
    super()
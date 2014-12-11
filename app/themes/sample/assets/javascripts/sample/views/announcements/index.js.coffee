class Views.Announcements.IndexView extends Views.ApplicationView
  render: ->
    super()
    Widgets.Announcement.enable()

  cleanup: ->
    super()
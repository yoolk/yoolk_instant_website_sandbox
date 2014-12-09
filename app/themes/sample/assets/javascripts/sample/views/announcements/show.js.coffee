window.Views.Announcements ||= {}
class Views.Announcements.ShowView extends Views.ApplicationView
  render: ->
    super()
    Widgets.Announcement.enable()

  cleanup: ->
    super()
window.Views.Announcements ||= {}
class Views.Announcements.IndexView extends Views.ApplicationView
  render: ->
    super()
    Announcements.ToolTip.enable()
    Announcements.TimeAgo.enable()

  cleanup: ->
    super()
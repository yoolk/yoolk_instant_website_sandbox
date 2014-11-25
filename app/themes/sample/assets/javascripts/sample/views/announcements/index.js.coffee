window.Views.Announcements ||= {}
class Views.Announcements.IndexView extends Views.ApplicationView
  render: ->
    super()
    $("time.timeago").timeago()
    $('.tooltip_link').tooltip()

  cleanup: ->
    super()
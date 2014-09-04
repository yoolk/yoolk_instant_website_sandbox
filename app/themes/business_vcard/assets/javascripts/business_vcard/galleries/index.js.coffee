$(window).load ->

  _collageRemoveWhiteSpace = ->
    $('.collage').removeWhitespace().collagePlus()

  _collage = ->
    $('.collage').collagePlus({
      'targetHeight'        : 250,
      'fadeSpeed'           : 3000,
      'effect'              : 'effect-2',
      'direction'           : 'vertical',
      'allowPartialLastRow' : true
      })

  _collageRemoveWhiteSpace()
  _collage()

$(window).load ->

  _collageRemoveWhiteSpace = ->
    $('.Collage').removeWhitespace().collagePlus()

  _collage = ->
    $('.Collage').collagePlus({
      'targetHeight'        : 200,
      'fadeSpeed'           : 3000,
      'effect'              : 'effect-2',
      'direction'           : 'vertical',
      'allowPartialLastRow' : true
      })

  _collageRemoveWhiteSpace()
  _collage()

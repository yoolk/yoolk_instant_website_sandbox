$(document).ready ->
  initCollageImages = ->
  $(".Collage").imagesLoaded ->
    $(".Collage").removeWhitespace()
    $(".Collage").collagePlus({
      "targetHeight"        : 200,
      "fadeSpeed"           : 3000,
      "effect"              : "effect-6",
      "direction"           : "vertical",
      "allowPartialLastRow" : true
      })
  initCollageImages()
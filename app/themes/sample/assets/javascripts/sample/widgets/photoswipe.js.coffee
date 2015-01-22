class Yoolk.Widgets.PhotoSwipe extends PhotoSwipe
  @enable: (gallerySelector) ->
    # parse slide data (url, title, size ...) from DOM elements (links)
    parseThumbnailElements = (el) ->
      thumbElements = el.childNodes
      numNodes = thumbElements.length
      items = []
      el = undefined
      childElements = undefined
      thumbnailEl = undefined
      size = undefined
      item = undefined
      i = 0

      while i < numNodes
        el = thumbElements[i]

        # include only element nodes
        if el.nodeType isnt 1
          i++
          continue
        childElements = el.children
        size = el.getAttribute("data-size").split("x")

        # create slide object
        item =
          src: el.getAttribute("href")
          w: parseInt(size[0], 10)
          h: parseInt(size[1], 10)

        item.el = el # save link to element for getThumbBoundsFn
        if childElements.length > 0
          item.msrc = childElements[0].getAttribute("src") # thumbnail url
          item.title = childElements[1].innerHTML  if childElements.length > 1 # caption (contents of figure)
        items.push item
        i++
      items


    # find nearest parent element
    closest = closest = (el, fn) ->
      el and ((if fn(el) then el else closest(el.parentNode, fn)))


    # triggers when user clicks on thumbnail
    onThumbnailsClick = (e) ->
      e = e or window.event
      (if e.preventDefault then e.preventDefault() else e.returnValue = false)
      eTarget = e.target or e.srcElement
      clickedListItem = closest(eTarget, (el) ->
        el.tagName is "A"
      )
      return  unless clickedListItem
      clickedGallery = clickedListItem.parentNode
      childNodes = clickedListItem.parentNode.childNodes

      numChildNodes = childNodes.length
      nodeIndex = 0
      index = undefined
      i = 0

      while i < numChildNodes
        if childNodes[i].nodeType isnt 1
          i++
          continue
        if childNodes[i] is clickedListItem
          index = nodeIndex
          break
        nodeIndex++
        i++
      openPhotoSwipe index, clickedGallery  if index >= 0
      false


    # parse picture index and gallery index from URL (#&pid=1&gid=2)
    photoswipeParseHash = ->
      hash = window.location.hash.substring(1)
      params = {}
      return params  if hash.length < 5
      vars = hash.split("&")
      i = 0

      while i < vars.length
        unless vars[i]
          i++
          continue
        pair = vars[i].split("=")
        if pair.length < 2
          i++
          continue
        params[pair[0]] = pair[1]
        i++
      params.gid = parseInt(params.gid, 10)  if params.gid
      return params  unless params.hasOwnProperty("pid")
      params.pid = parseInt(params.pid, 10)
      params

    openPhotoSwipe = (index, galleryElement, disableAnimation) ->
      pswpElement = document.querySelectorAll(".pswp")[0]
      gallery = undefined
      options = undefined
      items = undefined
      items = parseThumbnailElements(galleryElement)

      # define options (if needed)
      options =
        index: index

        # define gallery index (for URL)
        galleryUID: galleryElement.getAttribute("data-pswp-uid")
        getThumbBoundsFn: (index) ->

          # See Options -> getThumbBoundsFn section of docs for more info
          thumbnail = items[index].el.children[0]
          pageYScroll = window.pageYOffset or document.documentElement.scrollTop
          rect = thumbnail.getBoundingClientRect()
          x: rect.left
          y: rect.top + pageYScroll
          w: rect.width


        # history & focus options are disabled on CodePen
        # remove these lines:
        historyEnabled: false
        focus: false

      options.showAnimationDuration = 0  if disableAnimation

      # Pass data to PhotoSwipe and initialize it
      gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options)
      gallery.init()
      return


    # loop through all gallery elements and bind events
    galleryElements = document.querySelectorAll(gallerySelector)
    i = 0
    l = galleryElements.length

    while i < l
      galleryElements[i].setAttribute "data-pswp-uid", i + 1
      galleryElements[i].onclick = onThumbnailsClick
      i++

    # Parse URL and open gallery if it contains #&pid=3&gid=1
    hashData = photoswipeParseHash()
    openPhotoSwipe hashData.pid - 1, galleryElements[hashData.gid - 1], true  if hashData.pid > 0 and hashData.gid > 0
    return
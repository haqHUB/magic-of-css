home = {}

home.init = ->
    firedMouseMove = false
    window.addEventListener 'mousemove', ->
        return if firedMouseMove
        firedMouseMove = true
        document.body.className += ' mouse-has-moved'

    firedScroll = false
    window.addEventListener 'scroll', ->
        return if firedScroll
        firedScroll = true
        document.body.className += ' window-has-been-scrolled'

    if localStorage.hasBeenHereBefore is true
        document.querySelector('.logo').className = 'logo'
        document.body.className += ' has-been-here-before'
    else
        localStorage.hasBeenHereBefore = true

    referrerHostname = document.referrer.match(/:\/\/(.[^/]+)/)?[1].split(':')[0]

    if document.location.hostname is referrerHostname or localStorage.hasBeenHereBefore is true
        document.querySelector('.logo').className = 'logo'
        document.body.className += ' has-been-here-before'

    document.body.className += ' trigger-pageload-animations'

window.home = home
setTimeout home.init
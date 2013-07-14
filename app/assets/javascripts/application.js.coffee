#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require gauges
#= require_tree .

init = () ->
  $(document).on 'scroll', ->
    $('body').css('background-position', 'center ' + $(window).scrollTop() * 0.8 + 'px')

$ ->
  init()

$(document).on 'page:change', ->
  init()
  _gauges.push(['track'])

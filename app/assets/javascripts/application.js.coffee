#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require gauges
#= require_tree .

init = () ->

$ ->
  init()

$(document).on 'page:change', ->
  init()
  _gauges.push(['track'])

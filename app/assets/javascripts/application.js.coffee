#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require gauges
#= require_tree .

$(document).on 'page:change', ->
  _gauges.push(['track']);

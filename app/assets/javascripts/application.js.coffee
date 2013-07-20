#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require gauges
#= require_tree .

class HomeForm
  constructor: (@mailbox, @form) ->
    @conformSize()
    $(window).on 'resize', $.proxy(@conformSize, this)

  conformSize: ->
    targetHeight = $(window).height() - 100
    if targetHeight <= 534 && targetHeight >= 330
      @resize(targetHeight)

  resize: (height) ->
    @mailbox.css('height', height)
    @form.css('margin-top', 150 + (height - 330) / 204 * 105)


init = () ->
  mailbox = new HomeForm($('.mailbox'), $('body.is-home .paper'))

$ ->
  init()

$(document).on 'page:change', ->
  init()
  _gauges.push(['track'])

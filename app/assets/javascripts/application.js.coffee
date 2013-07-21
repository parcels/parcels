#= require jquery_ujs
#= require gauges
#= require_tree .

$ ->
  class HomeForm
    constructor: (@mailbox, @form) ->
      @conformSize()
      $(window).on 'resize', $.proxy(@conformSize, this)

    conformSize: ->
      targetHeight = $(window).height() - 100
      @resize(Math.max(330, Math.min(targetHeight, 534)))

    resize: (height) ->
      @mailbox.css('height', height)
      @form.css('margin-top', 150 + (height - 330) / 204 * 105)


  mailbox = new HomeForm($('.mailbox'), $('body.is-home .paper'))
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "ready page:load", ->
  $('form').on 'click', '.remove_fields', (event) ->
    event.preventDefault()
    console.log('click remove')
    $(this).prev('input[type=hidden]').val('true')
    $(this).closest('fieldset').hide()
    $(this).closest('fieldset').hide()
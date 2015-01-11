# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# @board = Board.find(params[:id])

$(document).on "ready page:load", ->
  $('form').on 'click', '.remove_fields', (event) ->
    event.preventDefault()
    console.log('click remove')
    $(this).prev('input[type=hidden]').val('true')
    $(this).closest('fieldset').hide()
    $(this).closest('fieldset').hide()

  $('form').on 'click', '.Add_lesson', (event) ->
    event.preventDefault()
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))

  $ ->
    $('#boads').imagesLoaded ->
      $('#boards').masonry
        itemSelector: '.box'
        isFitWidth: true

  # $('#submitLesson').on 'click', (event) ->
  #   event.preventDefault()
  #   $('#results').append("<div class='container'><%=j render 'appendLesson'%></div>");

  
  # $.ajax(url: "/test").done (html) ->
  # $("#results").append html
  # $.ajax(url: "/boards/" + @board + "/lessons/" + @board.lessons + "/edit").done (html) ->
  #   event.preventDefault()
  #   $("#results").append html

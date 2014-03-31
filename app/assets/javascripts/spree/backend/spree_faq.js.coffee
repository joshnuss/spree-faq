#= require spree/backend

(($) ->
  $('form').on 'click', '.add_fields', ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $('form').on 'click', '.remove', ->
    $(this).parent('.question').children(':hidden[id$=delete]').val(1)
    $(this).parent('.question').slideUp('slow')
    event.preventDefault()

  $('#new_question_link').on 'click', ->
    $('#questions').append(new_question_html.replace(/NEW_RECORD/g, $('#questions .question').size()))
    $('#questions .question:last .remove').on 'click', ->
      $(this).parent('.question').remove()

    $.scrollTo($('#questions .question:last'), 800)
    $('.question:last input:first').focus()

) jQuery
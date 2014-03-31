#= require spree/frontend

(($) ->
  $('.answer').hide()
  $('.question').on 'click', ->
    id = $(this).attr('id').split('_')[1]
    $('#answer_' + id).slideToggle()
    return false

) jQuery

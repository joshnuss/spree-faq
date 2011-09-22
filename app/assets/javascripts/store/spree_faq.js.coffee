$ ->
  $('.answer').hide()
  $('.question').click ->
    id = $(this).attr('id').split('_')[1]
    $('#answer_' + id).slideToggle()

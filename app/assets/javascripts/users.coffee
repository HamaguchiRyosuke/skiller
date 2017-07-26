# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('#skill-tags').tagit()
    fieldName:   'skill_list'
    singleField: true
  $('#skill-tags').tagit()
  skill_string = $("#skill_hidden").val()
  try
    skill_list = skill_string.split(',')
    for tag in skill_list
      $('#skill-tags').tagit 'createTag', tag
  catch error

# $(document).on 'ready page:load', ->
#   $('#skill-tags').tagit()

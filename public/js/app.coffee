# front page navi functionality
# quick & dirty...
$("#exercises-link").click ->
  $(@).parent().parent().parent().find('a').removeClass("active")
  $(@).addClass("active")
  #
  $(".page").removeClass("prev").removeClass("next").removeClass("curr")
  #
  $("#info-page").addClass("next")
  $("#exercises-page").addClass("curr")
  pageChange()

$("#info-link").click ->
  $(@).parent().parent().parent().find('a').removeClass("active")
  $(@).addClass("active")
  #
  $(".page").removeClass("prev").removeClass("next").removeClass("curr")
  #
  $("#exercises-page").addClass("prev")
  $("#info-page").addClass("curr")
  pageChange()

if window.location.hash is "#info"
  $("#info-link").click()

resizePageWrapperToPageContentHeight = ->
  pageHeight = $('.page.curr').outerHeight(true)
  $('#page-wrapper').height(pageHeight)

$(window).resize _.debounce(->
  resizePageWrapperToPageContentHeight()
, 500)
resizePageWrapperToPageContentHeight()

pageChange = ->
  resizePageWrapperToPageContentHeight()

# uncomment to disable access to exercise
# if previous ones have not been done yet
#toggleExerciseButton = (link,enableOrDisable) ->
  #s = if enableOrDisable is 'enable' then true else false
  #return if s and !link.hasClass 'disabled'
  #href = link.attr('href')
  #if !s
    #link.attr('href','#')
    #link.addClass('disabled');
    #link.attr('data-orig-href',href)
  #if s
    #link.attr('href',link.attr('data-orig-href'))
    #link.removeClass('disabled');

#$(".exercise-button").each ->
  #isWarmup = $(@).hasClass('warmup')
  #isFirst = $(@).hasClass('basics')
  #toggleExerciseButton($(@), 'disable') unless isWarmup or isFirst

# done exercises indicators
completedLevels = JSON.parse localStorage.getItem('completedLevels')
if completedLevels?
  for exercise in ["basics","loops","vars","ifs","events"]
    levelsDone = 0
    for level, levelIndex in ["first","second","third"]
      if completedLevels[exercise+"_level"+(levelIndex+1)] is true
        levelsDone++
        button = $("."+exercise)
        button.find(".stars ."+level).css("opacity",1)
        # uncomment to disable access to exercise
        # if previous ones have not been done yet
        #toggleExerciseButton(button.next(), 'enable') if levelsDone is 3
        #toggleExerciseButton(button, 'enable')

resetProgress = ->
  # remove everything but the playground code
  for key of localStorage
    localStorage.removeItem key if key isnt "playground_level1_code" and key isnt "firstVisit"
  location.reload()

$(".reset-button").click ->
  return unless confirm(L.translations['reset_confirm'])
  resetProgress()

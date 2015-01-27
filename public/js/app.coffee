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

$("#info-link").click ->
  $(@).parent().parent().parent().find('a').removeClass("active")
  $(@).addClass("active")
  #
  $(".page").removeClass("prev").removeClass("next").removeClass("curr")
  #
  $("#exercises-page").addClass("prev")
  $("#info-page").addClass("curr")

resizePageWrapperToPageContentHeight = ->
  pageHeight = $('.page').outerHeight(true)
  $('#page-wrapper').height(pageHeight)

$(window).resize _.debounce(->
  resizePageWrapperToPageContentHeight()
, 500)
resizePageWrapperToPageContentHeight()

# done exercises indicators
completedLevels = JSON.parse localStorage.getItem('completedLevels')
if completedLevels?
  for exercise in ["basics","loops","vars","ifs","events"]
    for level, levelIndex in ["first","second","third"]
      if completedLevels[exercise+"_level"+(levelIndex+1)] is true
        $("."+exercise+" .stars ."+level).css("opacity",1);

resetProgress = ->
  localStorage.clear()
  location.reload()

$(".reset-button").click ->
  return unless confirm("Haluatko varmasti aloittaa alusta?")
  resetProgress()
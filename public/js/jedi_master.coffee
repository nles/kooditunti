@JediMaster =
  onTour: false
  initDone: false
  init: ->
    initDone = true
    $(document).foundation joyride:
      modal: false
      default_prev_button_text: 'palaa edelliseen'
      pre_step_callback: (i, step) ->
        # show modal on first step
        if i is 0
          Foundation.libs.joyride.show_modal()
          $(".joyride-modal-bg").show()
        else
          $(".joyride-modal-bg").hide()

        # keep previous button working even if we have a pause defined
        step.find('.joyride-prev-tip').click ->
          JediMaster.tourGoingBack = true
          setTimeout (-> JediMaster.tourGoingBack = false), 100
      post_step_callback: (i, step) ->
        $(".joyride-modal-bg").hide() if step.hasClass('hide-modal-next')
        unless JediMaster.tourGoingBack
          JediMaster.pauseTour() if step.hasClass('pause-after')
          if step.find('.after-step-method').length == 1
            eval(step.find('.after-step-method').data('after-step'))
      post_ride_callback: ->
        $(".exercise-tip-placement").hide()
        JediMaster.onTour = false
      close_callback: ->
        $(".exercise-tip-placement").hide()
        JediMaster.onTour = false
      template:
        prev_button : '<a href="#" class="action joyride-prev-tip"></a>'

  tourGoingBack: false
  startTour: ->
    @init() unless @initDone
    JediMaster.onTour = true
    JediMaster.disableLinks()
    $(".exercise-tip-placement").show()
    unless Foundation.libs.joyride.settings.paused
      $(document).foundation('joyride', 'start');
      $('.joyride-close-tip').mouseup (-> JediMaster.onTour = false)
    else
      JediMaster.resumeTour()

  pauseTour: ->
    Foundation.libs.joyride.settings.paused = true
    $(".joyride-tip-guide:visible").removeClass("pause-after")
    $(".exercise-tip-placement").hide()

  resumeTour: (cb) ->
    $(".exercise-tip-placement").show()
    Foundation.libs.joyride.settings.paused = false
    Foundation.libs.joyride.go_next()
    $(".joyride-modal-bg").hide()
    cb() if cb?

  closeModalDialog: ->
    $("#guide-modal").remove()
    $(".joyride-modal-bg").remove()

  linksDisabled: false
  disableLinks: ->
    return if JediMaster.linksDisabled
    JediMaster.linksDisabled = true
    $("a").not('.joyride-next-tip, .joyride-prev-tip, .joyride-close-tip').click (e) ->
      if JediMaster.onTour
        e.preventDefault()
        $(".joyride-next-tip").fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100);

  pointModalWithGuidance: (msg,pos) ->
    #$(document).foundation('joyride', 'start');
    jrtg = '<div id="guide-modal" class="joyride-tip-guide"'
    jrtg+= 'data-index="0" style="visibility: visible; display: block;'
    jrtg+= 'top: '+pos[1]+'px; left: '+pos[0]+'px;">'
    jrtg+= '<span class="joyride-nub left"></span><div class="joyride-content-wrapper normal-padding">'
    jrtg+= '<p>'+msg+'</p>'
    jrtg+= '<a href="javascript:void(0)" class="small button joyride-next-tip-custom close-btn">Sulje</a><a href="javascript:void(0)" class="joyride-close-tip close-btn">×</a></div></div>'
    $('body').append(jrtg)
    $("#guide-modal .close-btn").click ->
      $("#guide-modal").remove()

  retryDialog: (cb) ->
    jrtg = '<div id="guide-modal" class="joyride-tip-guide" data-index="0" style="visibility: visible; display: block; width: 375px;">'
    jrtg+= '<div class="joyride-content-wrapper normal-padding" style="text-align: center;">'
    jrtg+= '<p style="font-size:25px;">Harmi, tehtävä ei mennyt läpi.</p>'
    jrtg+= '<a href="#" class="small button close-btn">Jatka yrittämistä</a>'
    jrtg+= '<a href="#close" class="joyride-close-tip-custom close-btn">×</a></div></div>'
    jrtg+= '<div class="joyride-modal-bg" style="display: block;"></div>'
    $('body').append(jrtg)
    gm = $("#guide-modal")
    gm.css("left",($(window).width()/2)-(gm.width()/2))
    gm.css("top",($(window).height()/2)-(gm.height()/2))
    $("#guide-modal .close-btn").click ->
      JediMaster.closeModalDialog()
      cb()

  solutionViewer: () ->
    jrtg = '<div id="guide-modal" class="joyride-tip-guide" data-index="0" style="visibility: visible; display: block; width: 475px;">'
    jrtg+= '<div class="joyride-content-wrapper normal-padding" style="text-align: center;">'
    jrtg+= '<img id="solution-image" src="/blockly/solutions/'+Exercises.currentID+'.png" />'
    jrtg+= '<a href="#" class="small button close-btn">Sulje</a>'
    jrtg+= '<a href="#close" class="joyride-close-tip-custom close-btn">×</a></div></div>'
    jrtg+= '<div class="joyride-modal-bg" style="display: block;"></div>'
    $('body').append(jrtg)
    gm = $("#guide-modal")
    gm.css("left",($(window).width()/2)-(gm.width()/2))
    gm.find("#solution-image").one("load", ->
      # vertical center when image loaded
      gm.css("top",($(window).height()/2)-(gm.height()/2))
    ).each (-> $(@).load() if @complete)

    $("#guide-modal .close-btn").click ->
      JediMaster.closeModalDialog()

  successDialog: ->
    jrtg = '<div id="guide-modal" class="success-dialog joyride-tip-guide" data-index="0" style="visibility: visible; display: block; width: 375px;">'
    jrtg+= '<div class="joyride-content-wrapper normal-padding" style="text-align: center;">'
    jrtg+= '<div style="width: 165px;overflow: hidden; margin: 0px auto 5px auto;">'
    jrtg+= '<div class="animated tada" style="width:30%;float:left;margin-top:15px;"><img src="/img/star.png"></div>'
    jrtg+= '<div class="animated tada" style="width:40%;float:left;"><img src="/img/star.png"></div>'
    jrtg+= '<div class="animated tada" style="width:30%;float:left;margin-top:15px;"><img src="/img/star.png"></div>'
    jrtg+= '</div><p style="font-size:25px;">Hienoa, ratkaisit tehtävän!</p>'
    if Exercises.isLastLevel
      btnText = "Palaa harjoitusvalikkoon"
      btnHref = "/harjoitukset"
    else
      btnText = "Siirry seuraavaan tehtävään"
      btnHref = Exercises.nextLevelPath()
    jrtg+= '<a href="'+btnHref+'" class="small button joyride-next-tip-custom close-btn">'+btnText+'</a>'
    jrtg+= '<a href="#close" class="joyride-close-tip close-btn">×</a></div></div>'
    jrtg+= '<div class="joyride-modal-bg" style="display: block;"></div>'
    $('body').append(jrtg)
    gm = $("#guide-modal")
    gm.css("left",($(window).width()/2)-(gm.width()/2))
    gm.css("top",($(window).height()/2)-(gm.height()/2))
    $("#guide-modal .close-btn").click ->
      $("#guide-modal").remove()
      $(".joyride-modal-bg").remove()

  evaluateDialog: ->
    jrtg = '<div id="guide-modal" class="joyride-tip-guide evaluation-dialog" data-index="0" style="visibility: visible; display: block; width: 375px;">'
    jrtg+= '<div class="joyride-content-wrapper normal-padding">'
    jrtg+= '<div class="evaluation-selects-wrapper"></div>'
    jrtg+= '<a href="#close" class="joyride-close-tip-custom close-btn">×</a></div></div>'
    jrtg+= '<div class="joyride-modal-bg" style="display: block;"></div>'
    $('body').append(jrtg)
    gm = $("#guide-modal")
    gmEvlSelW = gm.find('.evaluation-selects-wrapper')
    $('#evaluation-selects').find('div').each ->
      evlRow = $("<div class='evaluation-row' />").append $('<span />').text($(@).text())
      evlSel = $("<select />")
      evlSel.append $('<option value="empty" />').text('')
      evlSel.append $('<option value="yes" />').text("Kyllä, mielestäni tämä pitää paikkansa.")
      evlSel.append $('<option value="no" />').text("Hups! Jatkan vielä tehtävän tekemistä.")
      evlRow.append evlSel
      gmEvlSelW.append evlRow

    firstRow = gmEvlSelW.find('.evaluation-row:first')
    firstRow.addClass("active")
    checkForCompletion = ->
      isComplete = true
      gmEvlSelW.find('select').each ->
        isComplete = false if @value isnt "yes"
      return isComplete

    changeAction = (e) ->
      isComplete = checkForCompletion()
      isNo = e.value is "no"
      JediMaster.closeModalDialog() if isNo or isComplete
      if isComplete
        JediMaster.successDialog()
        Exercises.markCompleted()
      return if isNo or isComplete
      next = $(e).parent().next()
      next.addClass("active") unless next.hasClass("active")

    gmEvlSelW.find('select').change (-> changeAction(@) )

    gm.css("left",($(window).width()/2)-(gm.width()/2))
    gm.css("top",($(window).height()/2)-(gm.height()/2))
    $("#guide-modal .close-btn").click ->
      JediMaster.closeModalDialog()

  exerciseHelpPopoverShow: (trigger,content) ->
    return if JediMaster.onTour
    $("#exercise-help").show()
    return if $("#exercise-help").length isnt 0
    trigger = $(trigger)
    pos = trigger.position()
    left = pos.left - 10
    top = pos.top + trigger.height() + 20
    jrtg = '<div id="exercise-help" class="joyride-tip-guide wide" style="display: block; top: '+top+'px; left: '+left+'px;">'
    jrtg+= '  <span class="joyride-nub top"></span>'
    jrtg+= '  <div class="joyride-content-wrapper normal-padding">'
    jrtg+= $(".task-overview").html()
    jrtg+= '<a class="action restart-joyride right">näytä koko ohjeistus uudelleen</a>'
    jrtg+= '<a class="action solution-viewer right">vilkaise ratkaisua</a>' if Exercises.hasSolution
    jrtg+= '  </div>'
    jrtg+= '</div>'
    $('body').append(jrtg)
    $("#exercise-help .restart-joyride").click ->
      $("#exercise-help").remove()
      JediMaster.startTour()
    $("#exercise-help .solution-viewer").click ->
      $("#exercise-help").remove()
      message = "Tämän olisi syytä olla aivan viimeinen keino jos et pääse eteenpäin. Oletko varma ettet saa tehtävää ratkaistua itse tai avun kanssa?"
      JediMaster.solutionViewer() if confirm message
    #$("#exercise-help").mouseover ->
      #console.log "mouseover"
      #JediMaster.exerciseHelpPopoverAllowHide = false
      #setTimeout (-> JediMaster.exerciseHelpPopoverAllowHide = true), 1000
    #$("#exercise-help").mouseout ->
      #console.log "mouseout"
      #setTimeout (-> JediMaster.exerciseHelpPopoverHide(@)), 500

  #exerciseHelpPopoverAllowHide: true
  exerciseHelpPopoverHide: (trigger,content) ->
    $("#exercise-help").hide()# if JediMaster.exerciseHelpPopoverAllowHide

  calculatePositionByBlock: (block) ->
    blockBB = block.svgGroup_.getBoundingClientRect()
    modalX = blockBB.left + blockBB.width + 20
    modalY = blockBB.top + $(window).scrollTop()
    return [modalX, modalY]

    #de = $("<div id='"+id+"' class='dummy' />")
    #de.css('width',100)
    #de.css('height',100)
    #de.css('left',x)
    #de.css('top',y)
    #$('body').append de

    #jr = $('<ol data-joyride />')
    #step1 = $("<div data-id='"+id+"' />")
    #step1.text("Testing")
    #jr.append step1
    #$('body').append jr

    #$(document).foundation('joyride', 'reflow')
    #$(document).foundation('joyride', 'start')


@JediMaster =
  onTour: false
  tourStarted: false
  tourGoingBack: false
  initDone: false
  init: ->
    initDone = true
    $(document).foundation joyride:
      modal: false
      default_prev_button_text: L.translations['return_to_previous']
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
        #unless JediMaster.tourGoingBack
        setTimeout ->
          if step.find('.before-step-method').length == 1
            eval(step.find('.before-step-method').data('exec'))
        ,0
      post_step_callback: (i, step) ->
        $(".joyride-modal-bg").hide() if step.hasClass('hide-modal-next')
        unless JediMaster.tourGoingBack
          JediMaster.pauseTour() if step.hasClass('pause-after')
          setTimeout ->
            if step.find('.after-step-method').length == 1
              eval(step.find('.after-step-method').data('exec'))
          ,0
      pre_ride_callback: ->
        # save current blocks when on tour start
        stashBlocks = ->
          if Blockly.mainWorkspace.getAllBlocks().length isnt 0
            xmlDom = Blockly.Xml.workspaceToDom(Blockly.getMainWorkspace());
            xmlText = Blockly.Xml.domToText(xmlDom);
            localStorage.setItem(Exercises.currentID+"_stashedCode",xmlText);
            Exercises.resetCodeArea("noprompt")
        setTimeout (-> stashBlocks() ), 100 if Exercises.preloadBlocklyBlocks
      post_ride_callback: JediMaster.endTour
      close_callback: JediMaster.endTour
      #abort_on_close: false
      template:
        prev_button : '<a href="#" class="action joyride-prev-tip"></a>'


  endTour: ->
    # restore blocks when we end tour
    if Exercises.preloadBlocklyBlocks and localStorage.getItem(Exercises.currentID+"_stashedCode")?
      $.each Blockly.mainWorkspace.getAllBlocks(), (-> @dispose())
      xml = Blockly.Xml.textToDom(localStorage.getItem(Exercises.currentID+"_stashedCode"));
      Blockly.Xml.domToWorkspace(Blockly.getMainWorkspace(), xml);
    #localStorage.setItem(Exercises.currentID+"_stashedCode",null);
    $(".exercise-tip-placement").hide()
    JediMaster.onTour = false

  startTour: ->
    return if $(".joyride-list").length is 0
    @init() unless @initDone
    JediMaster.onTour = true
    JediMaster.tourStarted = true
    JediMaster.disableLinks()
    Exercises.endExecution("nodialog")
    $(".exercise-tip-placement").show()
    unless Foundation.libs.joyride.settings.paused
      $(document).foundation('joyride', 'start');
      $('.joyride-close-tip').mouseup (-> JediMaster.onTour = false)
    else
      JediMaster.resumeTour()

  pauseTour: ->
    @onTour = false
    Foundation.libs.joyride.settings.paused = true
    $(".joyride-tip-guide:visible").removeClass("pause-after")
    $(".exercise-tip-placement").hide()

  resumeTour: (cb) ->
    return unless @tourStarted
    @onTour = true
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

  blockCollapseDisclaimer: (block) ->
    pos = @calculatePositionByBlock(block)
    #$(document).foundation('joyride', 'start');
    jrtg = '<div id="guide-modal" class="joyride-tip-guide"'
    jrtg+= 'data-index="0" style="visibility: visible; display: block;'
    jrtg+= 'top: '+pos[1]+'px; left: '+pos[0]+'px;">'
    jrtg+= '<span class="joyride-nub left"></span><div class="joyride-content-wrapper normal-padding">'
    jrtg+= '<p>' + L.translations['doubleclick_the_block_to_see_it']+ '</p>'
    jrtg+= '<a href="javascript:void(0)" class="small button joyride-next-tip-custom close-btn">Sulje</a><a href="javascript:void(0)" class="joyride-close-tip close-btn">×</a></div></div>'
    $('body').append(jrtg)
    $("#guide-modal .close-btn").click ->
      $("#guide-modal").remove()

  pointModalWithGuidance: (msg,pos) ->
    #$(document).foundation('joyride', 'start');
    jrtg = '<div id="guide-modal" class="joyride-tip-guide"'
    jrtg+= 'data-index="0" style="visibility: visible; display: block;'
    jrtg+= 'top: '+pos[1]+'px; left: '+pos[0]+'px;">'
    jrtg+= '<span class="joyride-nub left"></span><div class="joyride-content-wrapper normal-padding">'
    jrtg+= '<p>'+msg+'</p>'
    jrtg+= '<a href="javascript:void(0)" class="small button joyride-next-tip-custom close-btn">' + L.translations['close_tooltip'] + '</a><a href="javascript:void(0)" class="joyride-close-tip close-btn">×</a></div></div>'
    $('body').append(jrtg)
    $("#guide-modal .close-btn").click ->
      $("#guide-modal").remove()

  retryDialog: (cb) ->
    jrtg = '<div id="guide-modal" class="joyride-tip-guide" data-index="0" style="visibility: visible; display: block; width: 375px;">'
    jrtg+= '<div class="joyride-content-wrapper normal-padding" style="text-align: center;">'
    jrtg+= '<p style="font-size:25px;">' + L.translations['exercise_not_complete_message'] + '</p>'
    jrtg+= '<a href="#" class="small button close-btn">' + L.translations['keep_trying_btn_caption'] + '</a>'
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
    jrtg+= '</div><p style="font-size:25px;">' + L.translations['great_work_exercise_solved'] + '</p>'
    if Exercises.isLastLevel
      btnText = L.translations['return_to_exercise_menu']
      btnHref = "/"
    else
      btnText = L.translations['goto_next_exercise']
      btnHref = Exercises.nextLevelPath()
    window.getEvaluationID = (-> return Exercises.currentID)
    es = "<iframe src='/exercise-evaluation-" + L.translations['locale'] + ".html#white' id='exercise-evaluation'></iframe>"
    jrtg+= es
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
      evlSel.append $('<option value="empty" />').html(L.translations['evaluation_option_empty'])
      evlSel.append $('<option value="yes" />').text(L.translations['evaluation_option_yes'])
      evlSel.append $('<option value="no" />').text(L.translations['evaluation_option_no'])
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
    jrtg+= '<a class="action restart-joyride right">' + L.translations['show_help_again'] + '</a>' if Exercises.currentName isnt "playground"
    jrtg+= '<a class="action solution-viewer right">' + L.translations['peek_at_the_solution'] + '</a>' if Exercises.hasSolution
    jrtg+= '  </div>'
    jrtg+= '</div>'
    $('body').append(jrtg)
    $("#exercise-help .restart-joyride").click ->
      $("#exercise-help").remove()
      JediMaster.startTour()
    $("#exercise-help .solution-viewer").click ->
      $("#exercise-help").remove()
      message = L.translations['peek_notification']
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


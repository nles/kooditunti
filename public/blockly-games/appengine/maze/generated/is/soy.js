// This file was automatically generated from template.soy.
// Please don't edit this file by hand.

goog.provide('Maze.soy');

goog.require('soy');
goog.require('soydata');
goog.require('BlocklyGames.soy');


Maze.soy.messages = function(opt_data, opt_ignored, opt_ijData) {
  return BlocklyGames.soy.messages(null, null, opt_ijData) + '<div style="display: none"><span id="Maze_moveForward">færa áfram</span><span id="Maze_turnLeft">snúa til vinstri</span><span id="Maze_turnRight">snúa til hægri</span><span id="Maze_doCode">gera</span><span id="Maze_elseCode">annars</span><span id="Maze_helpIfElse">Ef-annars kubbar gera eitt eða annað.</span><span id="Maze_pathAhead">ef slóð framundan</span><span id="Maze_pathLeft">ef slóð til vinstri</span><span id="Maze_pathRight">ef slóð til hægri</span><span id="Maze_repeatUntil">endurtaka þar til</span><span id="Maze_moveForwardTooltip">Færir leikmann fram um eitt bil.</span><span id="Maze_turnTooltip">Snýr leikmanninum til vinstri eða hægri um 90 \\ngráður. </span><span id="Maze_ifTooltip">Ef það er slóð í valda stefnu, \\nþá á að gera eitthvað. </span><span id="Maze_ifelseTooltip">Ef það er slóð í valda stefnu þá á að gera fyrri \\nkubbinn. Annars á að gera seinni kubbinn. </span><span id="Maze_whileTooltip">Endurtaka innifaldar aðgerðir þar til endapunkti \\ner náð. </span><span id="Maze_capacity0">Þú átt %0 kubba eftir.</span><span id="Maze_capacity1">Þú átt %1 kubb eftir.</span><span id="Maze_capacity2">Þú átt %2 kubba eftir.</span></div>';
};


Maze.soy.start = function(opt_data, opt_ignored, opt_ijData) {
  return Maze.soy.messages(null, null, opt_ijData) + '<table width="100%"><tr><td><h1>' + BlocklyGames.soy.titleSpan({appName: 'Völundarhús'}, null, opt_ijData) + BlocklyGames.soy.levelLinks({level: opt_ijData.level, maxLevel: opt_ijData.maxLevel, lang: opt_ijData.lang, suffix: '&skin=' + soy.$$escapeHtml(opt_ijData.skin)}, null, opt_ijData) + '</h1></td><td class="farSide"><select id="languageMenu"></select>&nbsp;<button id="linkButton" title="Vista og tengja við kubba."><img src="media/1x1.gif" class="link icon21"></button>&nbsp;<button id="pegmanButton"><img src="media/1x1.gif"><span id="pegmanButtonArrow"></span></button></td></tr></table><div id="visualization"><svg xmlns="http://www.w3.org/2000/svg" version="1.1" id="svgMaze" width="400px" height="400px"><g id="look"><path d="M 0,-15 a 15 15 0 0 1 15 15" /><path d="M 0,-35 a 35 35 0 0 1 35 35" /><path d="M 0,-55 a 55 55 0 0 1 55 55" /></g></svg><div id="capacityBubble"><div id="capacity"></div></div></div><table width="400"><tr><td style="width: 190px; text-align: center; vertical-align: top;"><td><button id="runButton" class="primary" title="Lætur leikmanninn gera það sem kubbarnir segja."><img src="media/1x1.gif" class="run icon21"> Keyra forritið</button><button id="resetButton" class="primary" style="display: none" title="Setja leikmanninn aftur á upphafsreit."><img src="media/1x1.gif" class="stop icon21"> Byrja aftur</button></td></tr></table>' + Maze.soy.toolbox(null, null, opt_ijData) + '<div id="blockly"></div><div id="pegmanMenu"></div>' + BlocklyGames.soy.dialog(null, null, opt_ijData) + BlocklyGames.soy.doneDialog(null, null, opt_ijData) + BlocklyGames.soy.abortDialog(null, null, opt_ijData) + BlocklyGames.soy.storageDialog(null, null, opt_ijData) + ((opt_ijData.level == 1) ? '<div id="dialogHelpStack" class="dialogHiddenContent"><table><tr><td><img src="common/help.png"></td><td>&nbsp;</td><td>Raðaðu tveimur \'færa áfram\' kubbum saman til að hjálpa mér að ná takmarkinu.</td><td valign="top"><img src="maze/help_stack.png" class="mirrorImg" height=63 width=136></td></tr></table></div><div id="dialogHelpOneTopBlock" class="dialogHiddenContent"><table><tr><td><img src="common/help.png"></td><td>&nbsp;</td><td>Í þessum áfanga þarftu að raða öllum kubbunum saman á hvíta svæðinu.<iframe id="iframeOneTopBlock" style="height: 80px; width: 100%; border: none;" src=""></iframe></td></tr></table></div><div id="dialogHelpRun" class="dialogHiddenContent"><table><tr><td>Keyrðu forritið til að sjá hvað gerist.</td><td rowspan=2><img src="common/help.png"></td></tr><tr><td><div><img src="maze/help_run.png" class="mirrorImg" height=27 width=141></div></td></tr></table></div>' : (opt_ijData.level == 2) ? '<div id="dialogHelpReset" class="dialogHiddenContent"><table><tr><td>Forritið þitt rataði ekki. Smelltu á \'Byrja aftur\' og reyndu betur.</td><td rowspan=2><img src="common/help.png"></td></tr><tr><td><div><img src="maze/help_run.png" class="mirrorImg" height=27 width=141></div></td></tr></table></div>' : (opt_ijData.level == 3) ? '<div id="dialogHelpRepeat" class="dialogHiddenContent"><table><tr><td><img src="maze/help_up.png"></td><td>Náðu út á enda slóðarinnar með því að nota bara tvo kubba. Notaðu \'endurtaka\' til að keyra kubb oftar en einu sinni.</td><td><img src="common/help.png"></td></tr></table></div>' : (opt_ijData.level == 4) ? '<div id="dialogHelpCapacity" class="dialogHiddenContent"><table><tr><td><img src="common/help.png"></td><td>&nbsp;</td><td>Þú hefur notað alla kubbana í þessum áfanga. Til að losa kubb verður þú að eyða honum úr forritinu.</td></tr></table></div><div id="dialogHelpRepeatMany" class="dialogHiddenContent"><table><tr><td><img src="maze/help_up.png"></td><td>Þú getur sett fleiri en einn kubb inn í \'endurtaka\' kubb.</td><td><img src="common/help.png"></td></tr></table></div>' : (opt_ijData.level == 5) ? '<div id="dialogHelpSkins" class="dialogHiddenContent"><table><tr><td><img src="common/help.png"></td><td>Veldu þér leikveru úr þessum lista.</td><td><img src="maze/help_up.png"></td></tr></table></div>' : (opt_ijData.level == 6) ? '<div id="dialogHelpIf" class="dialogHiddenContent"><table><tr><td><img src="maze/help_up.png"></td><td>\'Ef\' kubbur gerir eitthvað aðeins ef skilyrðið er satt. T.d. beygja til vinstri ef það er slóð til vinstri.</td><td><img src="common/help.png"></td></tr></table></div>' : (opt_ijData.level == 7) ? '<div id="dialogHelpMenu" class="dialogHiddenContent"><table><tr><td><img src="maze/help_up.png"></td><td id="helpMenuText">Smelltu á %1 í \'ef\' kubbnum til að breyta skilyrði hans.</td><td><img src="common/help.png"></td></tr></table></div>' : (opt_ijData.level == 9) ? '<div id="dialogHelpIfElse" class="dialogHiddenContent"><table><tr><td><img src="maze/help_down.png"></td><td>Ef-annars kubbar gera eitt eða annað.</td><td><img src="common/help.png"></td></tr></table></div>' : (opt_ijData.level == 10) ? '<div id="dialogHelpWallFollow" class="dialogHiddenContent"><table><tr><td><img src="common/help.png"></td><td>&nbsp;</td><td>Getur þú leyst þetta flókna völundarhús? Reyndu að fylgja veggnum á vinstri hönd. Aðeins fyrir reyndari forritara!' + BlocklyGames.soy.ok(null, null, opt_ijData) + '</td></tr></table></div>' : '');
};


Maze.soy.toolbox = function(opt_data, opt_ignored, opt_ijData) {
  return '<xml id="toolbox" style="display: none;"><block type="maze_moveForward"></block><block type="maze_turn"><field name="DIR">turnLeft</field></block><block type="maze_turn"><field name="DIR">turnRight</field></block>' + ((opt_ijData.level > 2) ? '<block type="maze_forever"></block>' + ((opt_ijData.level == 6) ? '<block type="maze_if"><field name="DIR">isPathLeft</field></block>' : (opt_ijData.level > 6) ? '<block type="maze_if"></block>' + ((opt_ijData.level > 8) ? '<block type="maze_ifElse"></block>' : '') : '') : '') + '</xml>';
};


Maze.soy.readonly = function(opt_data, opt_ignored, opt_ijData) {
  return Maze.soy.messages(null, null, opt_ijData) + '<div id="blockly"></div>';
};
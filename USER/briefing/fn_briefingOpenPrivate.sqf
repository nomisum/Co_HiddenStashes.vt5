/*
Parameter(s):
	_this select 0: ARRAY in format
		[text,picture]
			* text: STRING - hint text
			* picture: STRING - picture
		[item1,item2...] - Listbox item ARRAYs in format
			[itemText,itemDescription,picture,icon]
				* itemText: STRING - Text displayed in listbox
				* itemDescription (Optional): STRING - text displayed after clicking on item
				* picture (Optional): STRING - picture displayed after clicking on item
				* icon (Optional): STRING - icon displayed in listbox left from text
	_this select 1 (Optional): STRING - hint header
	_this select 2 (Optional): ARRAY - [STRING,CODE,NUMBER] - text on left button (when "", button is hidden), code executed upon clicking and fade out delay. If only text is present, button is disabled.
	_this select 3 (Optional): ARRAY - [STRING,CODE,NUMBER] - STRING - text on right button and code executed upon clicking
	_this select 4 (Optional): ARRAY - [STRING,CODE,NUMBER] - STRING - text on middle button and code executed upon clicking
	_this select 5 (Optional): NUMBER or ARRAY - width or [width,height] of picture (in grid coordinates). Width > 17 means only picture is used.

*/


// TEXTS

// COMMON
private _titleCommon = "<t size='2.0' font='Caveat' color='#ffff3333'>Please keep this personal briefing secret.</t><br/><br/>";

// None
private _titleNone =  if ((player getVariable ["missionControl_role", "none"]) == "none") then {
  "<t size='1.5' color='#99ffffff'>Sorry, no special role</t><br/><br/>" } else { "" };
private _textNone = if ((player getVariable ["missionControl_role", "none"]) == "none") then { "<t size='1.0' color='#ffffffff'>You are just an ordinary rebel. Keep your head down and stay alive. Try to accomplish all tasks to win this mission.</t><br/><br/>" } else { "" };

// PTL
private _titlePTL =  if ((player getVariable ["missionControl_role", "none"]) == "ptl") then {
  "<t size='1.5' color='#99ffffff'>PTL</t><br/><br/>" } else { "" };
private _textPTL = if ((player getVariable ["missionControl_role", "none"]) == "ptl") then { "<t size='1.0' color='#ffffffff'>You are truely fucked. Your rebel team is a bunch of idiots, special forces are out to hunt you and there are rumors of more bad things in the woods.<br/><br/>Your best bet is to keep your team together and prevent infighting. Adapt, survive, win.</t><br/><br/>" } else { "" };


// CULTIST
private _titleCultist =  if ((player getVariable ["missionControl_role", "none"]) == "cultist") then {
  "<t size='1.5' color='#99ff0000'>Cultist</t><br/><br/>" } else { "" };
private _textCultist= if ((player getVariable ["missionControl_role", "none"]) == "cultist") then { 
	"<t size='1.0' color='#ffffffff'>You are part of the cultist faction now. <br/><br/>
	You can perform rituals to spawn zombies. You can resurrect fallen enemies or minions. You can even teleport.<br/><br/>
	Beware all those actions can be seen and heard and need Mana.<br/><br/>
	Your Mana slowly replenishes automatically. Self Interact to activate NVG.<br/><br/>
	Prevent those zombie hating invaders from leaving the area alive!<br/><br/>Please dont pick up weapons.</t><br/><br/>" } else { "" };


// LDF
private _titleLDF =  if ((player getVariable ["missionControl_role", "none"]) == "ldf") then {
  "<t size='1.5' color='#99ff0000'>Special Forces</t><br/><br/>" } else { "" };
private _textLDF= if ((player getVariable ["missionControl_role", "none"]) == "ldf") then { 
	"<t size='1.0' color='#ffffffff'>You are part of the special forces faction now. <br/><br/>
	Hunt down the rebels and eliminate them. Sometimes our planes might give you indications on the map where our thermals picked up signals.<br/><br/>
New vehicles will be delivered to your base automatically. Be aware the russians will see entering their territory as an act of aggression and act accordingly.<br/><br/>
Attention: Growing rumors suggest there is an apocalyptic sect active in the border area. Treat them as any enemy and eliminate any threat.</t><br/><br/>" } else { "" };


[ parseText
  (
	_titleCommon +
	_titleNone +
	_textNone +
	_titlePTL +
	_textPTL +
    _titleCultist +
    _textCultist +
	_titleLDF +
	_textLDF
  )
] call grad_briefing_fnc_briefingScrollView;

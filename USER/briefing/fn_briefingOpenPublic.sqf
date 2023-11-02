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

// STORY
private _titleStory = "<t size='1.5' color='#99ffffff'>Story</t><br/>";
private _textStory = "<t size='1.0' color='#ffffffff'>In SUOMEN SANKARI an exploding nuclear plant unleashed hordes zombies. Rebels were responsible and are now hunted down by government troops. There is a apocalyptic sect active that seeks to destroy mankind. And dont forget the russians that want to keep defend their borders.</t><br/><br/>";

// TASK
private _titleTask = "<t size='1.5' color='#99ffffff'>Main Task</t><br/>";
private _textTask = "<t size='1.0' color='#ffffffff'>Your main task is to survive and flee.</t><br/><br/>";


[ parseText
  (
    _titleStory +
    _textStory +
    _titleTask +
    _textTask
  )
] call grad_briefing_fnc_briefingScrollView;


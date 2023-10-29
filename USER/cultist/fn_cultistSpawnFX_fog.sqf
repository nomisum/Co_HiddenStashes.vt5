params ["_position", "_duration"];

private _endTime = CBA_missionTime + _duration;
_position set [2,-0.5];

[{
	params ["_args", "_handle"];
	_args params ["_position", "_endTime"];

	if (_endTime < CBA_missionTime) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
	};

	drop ["\A3\data_f\cl_basic",
	"",
	"Billboard",
	1,
	5,
	_position,
	[random 0.1, random 0.1, 0.1 + random 0.1],
	5,
	0.2,0.1568,0,[.3 + random .1],
	[[1,1,1,0],[1,1,1,.2],[1,1,1,.3],[1,1,1,.3],[1,1,1,.2],[1,1,1,.15],[1,1,1,.05],[1,1,1,0]],
	[0],
	0,0,"", "",""];

}, 0.1, [_position, _endTime]] call CBA_fnc_addPerFrameHandler;

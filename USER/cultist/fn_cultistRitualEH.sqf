params ["_unit", "_placeholder"];

_unit setVariable ["cultist_manaDrain", true, true];
_unit setVariable ["cultist_placeholder", _placeholder, true];


[_unit, "Acts_JetsMarshallingStop_loop"] remoteExec ["switchMove"];

[{
	params ["_unit", "_placeholder"];
    animationState _unit != "Acts_JetsMarshallingStop_loop"
},{
	params ["_unit", "_placeholder"];
    _unit setVariable ["cultist_manaDrain", false, true];
	_unit setVariable ["cultist_placeholder", objNull, true];
	
	if (isNull _placeholder) exitWith {};

	private _unitsInvolved = _placeholder getVariable ["cultist_ritualInvolved", []];
	_unitsInvolved deleteAt (_unitsInvolved find player);
	_placeholder setVariable ["cultist_ritualInvolved", _unitsInvolved, true];

}, [_unit, _placeholder]] call CBA_fnc_waitUntilAndExecute;

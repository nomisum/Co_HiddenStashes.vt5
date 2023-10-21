params ["_player", "_sound"];

private _source = createSoundSource [_sound, getPos _player, [], 0];
[_source, _player, false] call grad_ambient_fnc_soundSourceHelper;
_player setVariable ["grad_missionControl_soundSource", _source];

[{
	params ["_player"];
	!(_player getVariable ["cultist_manaDrain", false])
},{
	params ["_player", "_source"];
	deleteVehicle _source;
}, [_player, _source]] call CBA_fnc_waitUntilAndExecute;
private _unassigned = [];

{
	private _buddy = _x getVariable ["grad_missionControl_buddy", objNull];
	diag_log format [([_x, false, false] call ace_common_fnc_getName) + " is in love with " + ([_buddy, false, false] call ace_common_fnc_getName)];
	
	if (isNull _buddy) then {
		_unassigned pushBackUnique ([_x, false, false] call ace_common_fnc_getName);
	};
} forEach allPlayers + (switchableUnits);

Systemchat str _unassigned;
diag_log str _unassigned;
/*

	handles respawns of players and sends their buddies with them

*/

if (!isServer) exitWith {

	["grad_missionControl_killed", {
		params ["_unit"];

		if (!(_unit getVariable ["isCultist", false])) then {
			private _buddy = _unit getVariable ["grad_missionControl_buddy", objNull];
			if (!isNull _buddy && {!(_unit getVariable ["isCultist", false])}) then {
				[] remoteExec ["grad_ambient_fnc_loversKill", _buddy];
			};
		};
	}] call CBA_fnc_addEventhandler;
};

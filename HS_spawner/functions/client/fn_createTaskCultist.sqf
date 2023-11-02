if (!isServer) exitWith {};

private _exists = ["blu_task_cultist"] call BIS_fnc_taskExists;

if (!_exists) then {
	[
		player, 
		["blu_task_cultist"], 
		["
		Use your powers (Self Interact), to kill our enemies. Be it rebels or system drones - cleanse the earth.
		", "Kill rebels and special forces alike", ""],
		objNull,
		1, 
		2, 
		true
	] call BIS_fnc_taskCreate;
};

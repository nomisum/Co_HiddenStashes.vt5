openMap true;

player setvariable ["ace_map_flashlight", ["ACE_Flashlight_MX991", objNull], true];

[["Choose your target destination", 1.5, [1, 1, 0, 1]], true] call CBA_fnc_notify;

private _handle = addMissionEventHandler ["MapSingleClick", {
		params ["_units", "_pos", "_alt", "_shift"];

		removeMissionEventhandler ["MapSingleClick", _thisEventHandler];
		player setvariable ["ace_map_flashlight", ["", objNull], true];
		playSound ['click', true];
		[player, _pos] remoteExec ["grad_cultist_fnc_cultistTeleport", 2];
		[["Teleporting...", 1.5, [1, 1, 0, 1]], true] call CBA_fnc_notify;
		openMap false;
		player setVariable ["cultist_teleporting", true];
}];
		
[{
	!visibleMap
}, {
	params ["_handle"];

	if (player getVariable ["cultist_teleporting", false]) exitWith {
		player setvariable ["ace_map_flashlight", ["", objNull], true];
	};
	removeMissionEventhandler ["MapSingleClick", _handle];
	player setvariable ["ace_map_flashlight", ["", objNull], true];
	
}, [_handle]] call CBA_fnc_WaitUntilAndExecute;
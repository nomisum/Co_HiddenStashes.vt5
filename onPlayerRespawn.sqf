[player] joinSilent (createGroup west);

private _id = ["grad_loadout_loadoutApplied",
{
	params ["_unit","_loadout"];
	if (_unit != player) exitWith {};
	
	if (!(player getVariable ["GRAD_isCultist", false])) then {
		[] execVM "custom\loadout\equipAsSpecialForce.sqf";
	} else {
		[] execVM "custom\loadout\equipAsCultist.sqf";
	};
}] call CBA_fnc_addEventhandler;
diag_log format ["loadout applied eh added %1", _id];


if (!(player getVariable ["GRAD_isCultist", false])) then {

	[{
		player linkitem "TFAR_fadak";
		player linkitem "ItemGps";
		player enableFatigue false;

		["Check your private briefing"] call CBA_fnc_notify;
	}, [], 5] call CBA_fnc_waitAndExecute;

	["Welcome to the Special Forces!"] call CBA_fnc_notify;
} else {
	call grad_cultist_fnc_cultistRespawn;	
};

[player] joinSilent (createGroup west);

if (!(player getVariable ["GRAD_isCultist", false])) then {
	execVM "custom\loadout\equipAsSpecialForce.sqf";

	[{
		player linkitem "TFAR_fadak";
		player linkitem "ItemGps";
		player enableFatigue false;

		["Check your private briefing"] call CBA_fnc_notify;
	}, [], 5] call CBA_fnc_waitAndExecute;

	["Welcome to the Special Forces!"] call CBA_fnc_notify;
} else {
	execVM "custom\loadout\equipAsCultist.sqf";
	call grad_cultist_fnc_cultistRespawn;	
};

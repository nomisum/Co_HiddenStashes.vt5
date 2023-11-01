if (!(player getVariable ["GRAD_isCultist", false])) then {
	[player] joinSilent (createGroup east);
	player setVariable ["originalSide", "EAST", true];
	[{
		player linkitem "ItemGps";
		player enableFatigue false;

		["Check your private briefing"] call CBA_fnc_notify;
	}, [], 5] call CBA_fnc_waitAndExecute;

	["Welcome to the Special Forces!"] call CBA_fnc_notify;

} else {
	[player] joinSilent (createGroup west);
	player setVariable ["originalSide", "WEST", true];
	call grad_cultist_fnc_cultistRespawn;
};

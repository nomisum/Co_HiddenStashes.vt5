[player] joinSilent (createGroup west);

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

// if (playerSide == INDEPENDENT) exitWith {[] call wita_common_fnc_startSpectator};


[] call wita_waverespawn_fnc_onPlayerKilled;
[player] joinSilent (createGroup west);
/*[player, true] call TFAR_fnc_forceSpectator;*/

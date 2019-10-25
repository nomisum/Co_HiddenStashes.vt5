// if (playerSide == INDEPENDENT) exitWith {[] call wita_common_fnc_startSpectator};


[] call wita_waverespawn_fnc_onPlayerKilled;

if (!(player getVariable ["HS_killedOnce", false])) then {
    player setVariable ["HS_killedOnce", true, true];
    [player] joinSilent (createGroup west);
    player setVariable ["ace_map_hideBlueForceMarker", false, true];
};
/*[player, true] call TFAR_fnc_forceSpectator;*/
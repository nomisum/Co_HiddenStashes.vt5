enableSaving [false, false];
enableSentences false;

["BLU_F", "us_army"] call GRAD_Loadout_fnc_FactionSetLoadout;
["IND_F", "agent"] call GRAD_Loadout_fnc_FactionSetLoadout;

[] execVM "dynamicSimulation.sqf";

1 setfog [0.7,0.1,0.1];

TFAR_fnc_activeSwRadio = {""}; // workaround for gruppe_adler_mod fnc missing TFAR
TFAR_fnc_activeLRRadio = {""};
// call diwako_cbrn_fnc_init;



[{
    params ["_args", "_handle"];
    setaperture 3;
}, 5, []] call CBA_fnc_addPerFrameHandler;

ryanzombiesglow = 1;
ryanzombiesstartinganim = 1;
Ryanzombiescanthrowdemon = 1;
Ryanzombiescanthrowdistancedemon = 30;
Ryanzombiescanthrowtank = 1;
Ryanzombiesfeed = 1;
ryanzombiescivilianattacks = true;
Ryanzombieslogicroam = 1;

{
    if (side _x == independent) then {
        _x setVariable ["ace_map_hideBlueForceMarker", true, true];
    } else {
        _x setVariable ["ace_map_hideBlueForceMarker", false, true];
    };
} forEach allGroups;
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

Ryanzombiescanthrow = 1;
Ryanzombiescanthrowdistance = 50;

Ryanzombiescanthrowtankdistance = 1;

Ryanzombiescanthrowdistancedemon = 150;
Ryanzombiescanthrowtank = 1;

Ryanzombiesfeed = 1;
ryanzombiescivilianattacks = true;
Ryanzombieslogicroam = 1;


Ryanzombiesattackspeed = 1;
Ryanzombiesattackdistance = 2.35;
Ryanzombiesattackstrenth = 1.5;
Ryanzombiesdamage = 0.15;
Ryanzombiesdamagecar = 0.2;
Ryanzombiesdamageair = 0.01;
Ryanzombiesdamagetank = 0.002;
Ryanzombiesdamagecarstrenth = 2;
Ryanzombiesdamageairstrenth = 1;
Ryanzombiesdamagetankstrenth = 0.4;

{
    if (side _x == independent) then {
        _x setVariable ["ace_map_hideBlueForceMarker", true, true];
    } else {
        _x setVariable ["ace_map_hideBlueForceMarker", false, true];
    };
} forEach allGroups;
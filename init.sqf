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
enableSaving [false, false];
enableSentences false;

["BLU_F", "us_army"] call GRAD_Loadout_fnc_FactionSetLoadout;
["IND_F", "agent"] call GRAD_Loadout_fnc_FactionSetLoadout;

[] execVM "dynamicSimulation.sqf";

1 setfog [0.7,0.1,0.1];

[{
    setaperture 3;
}, [], 3] call CBA_fnc_waitAndExecute;
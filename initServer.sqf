["Initialize", [true]] call BIS_fnc_dynamicGroups;
[false] call cbrn_fnc_init;

{
   _x setVariable ["ace_map_hideBlueForceMarker", true, true];
} forEach (playableUnits + switchableUnits);

WEST_SPIELER = createGroup west;
publicVariable "WEST_SPIELER";
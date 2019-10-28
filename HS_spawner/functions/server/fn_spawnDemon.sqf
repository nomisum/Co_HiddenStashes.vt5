params ["_position", "_side"];

private _zombie = objNull;

switch (_side) do { 
    case "west" : {  _zombie = [_position] call HS_spawner_fnc_spawnLDF; }; 
    case "east" : {  _zombie = [_position] call HS_spawner_fnc_spawnRussian; }; 
    default {  _zombie = [_position] call HS_spawner_fnc_spawnCivilians; }; 
};

_zombie setVariable ["RZ_isDemon", true];
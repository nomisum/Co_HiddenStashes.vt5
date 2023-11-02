if (!isServer) exitWith {};

grad_globalzombiegroup = createGroup east;
grad_globalzombiegroup setVariable ["ace_map_hideBlueForceMarker", true, true];

// all these guarantee Zs are only spawned on server
["HS_SpawnerRandomCivilian", {
    params ["_position", "_targetPosition", "_radius", "_speed", "_count"];

    [_position, _targetPosition, _radius, _speed, _count] call HS_spawner_fnc_spawnCiviliansCrowd;

}] call CBA_fnc_addEventhandler;


["HS_SpawnerRandomRussian", {
    params ["_position", "_speed"];

    [_position, _speed] call HS_spawner_fnc_spawnRussians;

}] call CBA_fnc_addEventhandler;


["HS_SpawnerRandomLDF", {
    params ["_position", "_speed"];

    [_position, _speed] call HS_spawner_fnc_spawnLDF;

}] call CBA_fnc_addEventhandler;

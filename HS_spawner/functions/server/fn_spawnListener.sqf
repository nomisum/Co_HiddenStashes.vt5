if (!isServer) exitWith {};

["HS_SpawnerRandomCivilian", {
    params ["_position", "_speed"];

    [_position, _speed] call HS_spawner_fnc_spawnCivilians;

}] call CBA_fnc_addEventhandler;
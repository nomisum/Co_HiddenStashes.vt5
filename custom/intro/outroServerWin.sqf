params ["_pos", "_targetPos", "_endPos"];

_pos set [2,40];
_targetPos set [2,50];
_endPos set [2,100];

private _vehicle = createVehicle ["RHS_AN2", _pos, [], 0, "FLY"];
_vehicle setDir (_vehicle getRelDir _targetPos);
_vehicle setVelocityModelSpace [0, 250, 100];
_vehicle flyInHeight 100;
createVehicleCrew _vehicle;
(group _vehicle) setBehaviour "CARELESS";
_vehicle engineOn true;
_vehicle setPilotLight true;
_vehicle setCaptive true;
(driver _vehicle) action ["CollisionLightOn", _vehicle];

(group _vehicle) addWaypoint [_targetPos, 0];
private _waypoint = (group _vehicle) addWaypoint [_endPos, 1];

_waypoint setWaypointStatements [
    "true","
    {{deleteVehicle _x} forEach crew _x; deleteVehicle _x; } forEach thisList;"
];

private _zombie = objNull;

for "_i" from 0 to 30 do {
     _zombie = [getMarkerPos "mrk_russia", "fast"] call HS_spawner_fnc_spawnRussians;
     sleep 0.5;
};

for "_i" from 0 to 4 do {
     private _offroad = "I_E_Offroad_01_comms_F" createVehicle getMarkerPos "mrk_russia";
     _offroad setDir (Random 360);
     createVehicleCrew _offroad;
     _offroad setPilotLight true;
     _offroad animate ["BeaconsStart", 1];
     _offroad animate ["Beacons", 1];
     _offroad animate ["StartBeaconLight", 1];
     {
        [_x] call HS_spawner_fnc_equipWithGasMask;
         moveOut _x;
         unassignVehicle _x;
     } forEach crew _offroad;
};

// playSound3D ["rhsgref\addons\rhsgref_air\AN2\data\sound\AN2_engine_low_ext.wss", _vehicle, false, getPos _vehicle, 1,1,0];

[[_vehicle, _targetPos, _zombie], "custom\intro\outroClientWin.sqf"] remoteExec ["BIS_fnc_execVM", 0];

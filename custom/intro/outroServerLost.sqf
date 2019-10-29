private _offroad = objNull;

[] spawn {
    for "_i" from 0 to 40 do {
        _zombie = [getMarkerPos "mrk_russia", east, "fast"] call HS_spawner_fnc_spawnDemon;
        sleep 1;
    };
};

for "_i" from 0 to 4 do {
     _offroad = "I_E_Offroad_01_comms_F" createVehicle getMarkerPos "mrk_russia";
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



[[_offroad], "custom\intro\outroClientLost.sqf"] remoteExec ["BIS_fnc_execVM", 0];
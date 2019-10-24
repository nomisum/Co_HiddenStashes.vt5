params [
    ["_position",[0,0]], 
    ["_speed","random"], 
    ["_count",9]
];
private _psx = _position select 0;
private _psy = _position select 1;
// _position ﻿params ["_psx", "_psy"];

private _radius = 6;

for "_i" from 0 to _count do {
    
    [{
        params ["_position", "_radius"];
        private _ang = random 360;
        private _rad = sqrt random 1.0;
        private _dsx = _radius * _rad * sin _ang;
        private _dsy = _radius * _rad * cos _ang;
        private _randomPosInCircle = [_psx + _dsx * cos - _dsy * sin, _psy + _dsx * sin + _dsy * cos]

        private _zombie = [_randomPosInCircle, _speed] call HS_spawner_fnc_spawnCivilians;

    }, [_position, _radius, _speed], random _count] call CBA_fnc_waitAndExecute;
};
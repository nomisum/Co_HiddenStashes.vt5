#include "component.hpp"

params ["_searchPos"];
private ["_nearEnemy","_tooCloseFound","_checkPos","_sectorID","_enemySector"];

if (wita_missionParam_PRESET == "DEBUG") then {
    for [{_k=0}, {_k<3}, {_k=_k+1}] do {
        for [{_j=0}, {_j<50}, {_j=_j+1}] do {
            deleteMarker format ["opfrespawn_debug_%1_%2",_k,_j];
        };
    };
};


for [{_h=0}, {_h<3}, {_h=_h+1}] do {
    _checkPos = _searchPos;
    _lastPos = _searchPos;
    _lastDir = CITYPOSITION getDir _searchPos;

    for [{_i=0}, {_i<50}, {_i=_i+1}] do {

        if (wita_missionParam_PRESET == "DEBUG") then {
            _m = createMarkerLocal [format ["opfrespawn_debug_%1_%2",_h,_i],_checkPos];
            _m setMarkerType "hd_dot";
            _m setMarkerColor "COLOREAST";
            _m setMarkerText format ["%1-%2",_h,_i];
        };

        _tooCloseFound = false;
        _nearEnemy = objNull;
        {
            _nearEnemy = _x;
            if (_checkPos distance2D _nearEnemy < 70) exitWith {_tooCloseFound = true};
        } forEach (allUnits select {side _x == INDEPENDENT && alive _x});

        _sectorID = [_checkPos] call wita_sectors_fnc_getSector;
        _enemySector = !(_sectorID == -1) && !([_sectorID] call wita_sectors_fnc_checkSector);
        if (!_tooCloseFound && !(surfaceIsWater _checkPos) && !_enemySector) exitWith {};

        _turn = if ((CITYPOSITION getDir _lastPos) < (CITYPOSITION getDir _checkPos)) then {1} else {-1};
        _lastPos = _checkPos;
        _lastDir = (_lastDir/5) + ((_nearEnemy getDir _checkPos)) + ((random 20)*_turn);
        _checkPos = _checkPos getPos [10,_lastDir];
    };

    if (!_tooCloseFound && !(surfaceIsWater _checkPos) && !_enemySector) exitWith {};
};

if (_tooCloseFound) then {_checkPos = _searchPos};
_checkPos

#include "component.hpp"

params ["_group","_pos"];

_group setVariable ["wita_waverespawn_groupIsRespawned",true,true];

if (side _group == WEST) then {
    {
        [{
            params ["_unit","_pos"];
            _respawnPos = _pos findEmptyPosition [3,40];
            if (count _respawnPos == 0) then {_respawnPos = _pos};
            [_unit,_respawnPos] remoteExec ["wita_waverespawn_fnc_doRespawn",0,false];
        }, [_x,_pos], random 2] call CBA_fnc_waitAndExecute;
    } forEach (units _group);
};

if (side _group == INDEPENDENT) then {
    {
        [{
            params ["_unit","_pos"];
            _respawnPos = _pos findEmptyPosition [3,40];
            if (count _respawnPos == 0) then {_respawnPos = _pos};
            [_unit,_respawnPos] remoteExec ["wita_waverespawn_fnc_doRespawn",0,false];
        }, [_x,_pos], random 2] call CBA_fnc_waitAndExecute;
    } forEach (units _group);
};

if (side _group == EAST) then {
    _pos = [_pos] call wita_waverespawn_fnc_findOpfRespawnPos;
    _building = [_pos,count (units _group)] call wita_waverespawn_fnc_findBuilding;
    if (!isNull _building) then {
        INFO_2("Respawning %1 group %2 in nearby building.",side _group,groupID _group);
        _buildingPositions = [_building] call wita_common_fnc_findBuildingPositions;
        {
            [{
                params ["_unit","_pos"];
                [_unit,_pos] remoteExec ["wita_waverespawn_fnc_doRespawn",0,false];
            }, [_x,_buildingPositions select _forEachIndex], random 2] call CBA_fnc_waitAndExecute;
        } forEach (units _group);
    } else {
        INFO_2("No building found for %1 group %2.",side _group,groupID _group);
        {
            [{
                params ["_unit","_pos"];
                _respawnPos = _pos findEmptyPosition [0,30];
                if (count _respawnPos == 0) then {_respawnPos = _pos};
                [_unit,_respawnPos] remoteExec ["wita_waverespawn_fnc_doRespawn",0,false];
            }, [_x,_pos], random 2] call CBA_fnc_waitAndExecute;
        } forEach (units _group);
    };
};

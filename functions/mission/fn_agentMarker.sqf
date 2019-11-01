#include "component.hpp"

params ["_agent"];

if (_agent getVariable ["wita_agentMarker_running",false]) exitWith {};
INFO_1("Agentmarker loop starting for %1.",name _agent);

private _markerVarianceDefault = [(missionConfigFile >> "cfgMission"), "agentMarkerVariance",100] call BIS_fnc_returnConfigEntry;
private _markerIntervalDefault = [(missionConfigFile >> "cfgMission"), "agentMarkerInterval",[2,2]] call BIS_fnc_returnConfigEntry;
private _markerFadeoutDefault = [(missionConfigFile >> "cfgMission"), "agentMarkerFadeout",1] call BIS_fnc_returnConfigEntry;
private _markerVarianceBase = [(missionConfigFile >> "cfgMission"), "agentMarkerVarianceBase",100] call BIS_fnc_returnConfigEntry;
private _markerIntervalBase = [(missionConfigFile >> "cfgMission"), "agentMarkerIntervalBase",5] call BIS_fnc_returnConfigEntry;
private _markerFadeoutBase = [(missionConfigFile >> "cfgMission"), "agentMarkerFadeoutBase",20] call BIS_fnc_returnConfigEntry;

private _markerIntervalMin = _markerIntervalDefault select 0;
private _markerIntervalRandom = (_markerIntervalDefault select 1) - _markerIntervalMin;
_agent setVariable ["wita_mission_currentAgentMarkerInterval",_markerIntervalMin + (random _markerIntervalRandom)];


[{
    params ["_args","_handle"];
    _args params ["_agent","_markerVarianceDefault","_markerIntervalMin","_markerIntervalRandom","_markerFadeoutDefault","_markerVarianceBase","_markerIntervalBase","_markerFadeoutBase"];

    if (!alive _agent || isNull _agent) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};

    private ["_currentInterval","_currentFadeout","_currentVariance"];
    if (_agent inArea WITA_BLUFORBASEAREA) then {
        _currentInterval = _markerIntervalBase;
        _currentFadeout = _markerFadeoutBase;
        _currentVariance = _markerVarianceBase;
    } else {
        _currentInterval = _agent getVariable ["wita_mission_currentAgentMarkerInterval",_markerIntervalMin];;
        _currentFadeout = _markerFadeoutDefault;
        _currentVariance = _markerVarianceDefault;
    };

    _lastRun = _agent getVariable ["wita_mission_lastAgentMarkerTime",0];
    if (CBA_missionTime - _lastRun < _currentInterval) exitWith {};
    _agent setVariable ["wita_mission_lastAgentMarkerTime", CBA_missionTime];
    _agent setVariable ["wita_mission_currentAgentMarkerInterval",_markerIntervalMin];

    private _cumulatedAddedDistance = [_agent, _currentVariance] call wita_mission_fnc_calculatePlayersNearby;
    private _markerPos = [getPos _agent,[0,_currentVariance],[0,360],""] call wita_common_fnc_findRandomPos;


    // [_markerPos] remoteExec ["wita_mission_fnc_showTracker",INDEPENDENT,false];

    [_agent, _markerPos, _currentVariance, _cumulatedAddedDistance, _currentFadeout] remoteExec ["WITA_mission_fnc_createMarkerLocal", INDEPENDENT];

} , 1, [_agent,_markerVarianceDefault,_markerIntervalMin,_markerIntervalRandom,_markerFadeoutDefault,_markerVarianceBase,_markerIntervalBase,_markerFadeoutBase]] call CBA_fnc_addPerFrameHandler;


_agent setVariable ["wita_agentMarker_running",true];

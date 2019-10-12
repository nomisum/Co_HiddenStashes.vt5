params ["_agent", "_currentVariance"];

private _cumulatedAddedDistance = 0;

{
    private _distanceToUnit  = _x distance _agent;

    if (_x != _agent && _distanceToUnit < _currentVariance) then {
        // ignore marker creation for this unit
        _x setVariable ["wita_mission_lastAgentMarkerTime",CBA_missionTime, true];
        _cumulatedAddedDistance = _cumulatedAddedDistance + _distanceToUnit;
    };
} forEach (playableUnits + switchableUnits);

(_cumulatedAddedDistance/2)
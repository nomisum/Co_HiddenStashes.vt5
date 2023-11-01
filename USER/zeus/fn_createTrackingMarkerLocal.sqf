params ["_agent", "_markerPos", "_currentVariance", "_cumulatedAddedDistance", "_currentFadeout"];

private _centerMarker = createMarkerLocal [format ["wita_agentmarker_%1_center_%2",[name _agent] call BIS_fnc_filterString,CBA_missionTime * 1000],_markerPos];
_centerMarker setMarkerShapeLocal "ICON";
_centerMarker setMarkerTypeLocal "hd_dot";
_centerMarker setMarkerColorLocal "COLORGUER";
_centerMarker setMarkerTextLocal (format ["%1",[daytime * 3600,"HH:MM"] call BIS_fnc_secondsToString]);

private _areaMarker = createMarkerLocal [format ["wita_agentmarker_%1_area_%2",[name _agent] call BIS_fnc_filterString,CBA_missionTime * 1000],_markerPos];
_areaMarker setMarkerShapeLocal "ELLIPSE";
_areaMarker setMarkerColorLocal "COLORGUER";
_areaMarker setMarkerSizeLocal [_currentVariance + _cumulatedAddedDistance,_currentVariance + _cumulatedAddedDistance];
_areaMarker setMarkerBrushLocal "Border";

[[_centerMarker,_areaMarker],_currentFadeout] call wita_common_fnc_fadeMarker;
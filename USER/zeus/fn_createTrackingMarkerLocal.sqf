params ["_markerPosition", "_markerSize", "_fadeOutTime", "_icon"];

private _centerMarker = createMarkerLocal [format ["wita_agentmarker_%1_center_%2", _markerPosition, CBA_missionTime * 1000],_markerPosition];
_centerMarker setMarkerShapeLocal "ICON";
_centerMarker setMarkerTypeLocal _icon;
_centerMarker setMarkerColorLocal "COLORPINK";
_centerMarker setMarkerTextLocal (format ["%1",[daytime * 3600,"HH:MM"] call BIS_fnc_secondsToString]);
_centerMarker setMarkerAlphaLocal 1;

private _areaMarker = createMarkerLocal [format ["wita_agentmarker_%1_area_%2",_markerPosition, CBA_missionTime * 1000],_markerPosition];
_areaMarker setMarkerShapeLocal "ELLIPSE";
_areaMarker setMarkerColorLocal "COLORPINK";
_areaMarker setMarkerSizeLocal [_markerSize, _markerSize];
_areaMarker setMarkerBrushLocal "Cross";
_areaMarker setMarkerAlphaLocal 1;

private _interval = 1/_fadeOutTime;
private _duration = CBA_missionTime + _fadeOutTime;

[{
	params ["_args", "_handle"];
	_args params ["_centerMarker", "_areaMarker", "_interval"];	

	private _alpha = markerAlpha _areaMarker;
	// systemchat str _alpha;

	if (_alpha <= 0) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
		deleteMarkerLocal _centerMarker;
		deleteMarkerLocal _areaMarker;

		diag_log "deleted unit marker for tracking";
	};
	
	_areaMarker setMarkerAlphaLocal (_alpha - _interval);

}, 1, [_centerMarker, _areaMarker, _interval]] call CBA_fnc_addPerFrameHandler;

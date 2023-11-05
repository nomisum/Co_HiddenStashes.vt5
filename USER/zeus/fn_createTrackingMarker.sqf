params [["_fadeOutTime", 120]];

private _allPlayers = switchableUnits + playableUnits;
private _independents = _allPlayers select { side _x == independent };

{
	private _position = getpos _x;
	private _maxDeviation = 200;
	private _markerSize = 200;
	private _icon = "loc_Rifle";

    private _markerPosition = [_position, _maxDeviation] call BIS_fnc_randomPosTrigger;

	[_markerPosition, _markerSize, _fadeOutTime, _icon] remoteExec ["grad_zeus_fnc_createTrackingMarkerLocal", west];

	{
		[_markerPosition, _markerSize, _fadeOutTime, _icon] remoteExec ["grad_zeus_fnc_createTrackingMarkerLocal", getAssignedCuratorUnit _x];
		["New Tracking Data on map"] remoteExec ["CBA_fnc_notify", getAssignedCuratorUnit _x];
	} forEach allCurators;
	
} forEach _independents;

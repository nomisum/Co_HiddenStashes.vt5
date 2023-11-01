params ["_vehicle"];

if (!isServer) exitWith {};

private _type = typeOf _vehicle;
private _position = position _vehicle;
private _dir = getdir _vehicle;

[{
	params ["_args", "_handle"];
	_args params ["_type", "_position", "_dir"];

	if (isNull (nearestObject [_position, _type])) then {
		private _heli = _type createVehicle _position;
		_heli setDir _dir;
	};

}, 5, [_type, _position, _dir]] call CBA_fnc_addPerFrameHandler;
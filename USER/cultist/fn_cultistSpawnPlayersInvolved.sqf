params ["_player", "_position"];

private _nearMen = _position nearEntities ["Man", 10];
private _menInvolved = [];
{
	if (_x getVariable ["GRAD_isCultist"] && {_x getVariable ["cultist_manaDrain", false]}) then {
		_menInvolved pushBackUnique _x;
	};
} forEach _nearMen;

_menInvolved
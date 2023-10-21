params ["_unit"];

private _ritual = objNull;
private _nearestPossibleRitual = nearestObject [player, "Land_HelipadEmpty_F"];

if (isNull _nearestPossibleRitual) exitWith { objNull };

if (count (_nearestPossibleRitual getVariable ["cultist_ritualInvolved", []]) > 0) then {
	_ritual = _nearestPossibleRitual;
};

_ritual
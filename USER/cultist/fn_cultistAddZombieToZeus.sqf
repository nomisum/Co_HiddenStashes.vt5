if !(isServer) exitWith {};

params ["_unit"];

{
	_x addCuratorEditableObjects [[_unit], true];
	nil
} count allCurators;

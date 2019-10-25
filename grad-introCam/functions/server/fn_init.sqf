[] remoteExec ["GRAD_introCam_fnc_play", [0,-2] select isDedicated, false];


{
    [_x] remoteExecCall ["GRAD_introCam_fnc_holsterWeapon", _x];
} forEach (switchableUnits + playableUnits);
/*
setTimeMultiplier 100;

sleep 40;

for "_i" from 0 to 99 do {
	setTimeMultiplier _multiPlier;
	_multiPlier = _multiPlier - 1;
	sleep 1;
};
*/
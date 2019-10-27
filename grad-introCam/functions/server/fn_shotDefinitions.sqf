// "_campos1", "_campos2", "_target", "_duration", "_zoom1", "_zoom2", "_isAttached", ["_offset",[0,0,0]],  "_radius"


/*
	
	CAM TYPES:

	["FREE", pos1, pos2, target, duration, fov1, fov2, offset (optional)],
	["ATTACHED", pos1, pos2, target, duration, fov1, fov2, offset (optional)],
	["ROTATE", angleStart, angleEnd, target, duration, fov1, fov2, radius (int), cclockwise (bool)]

*/

if (!isServer) exitWith {};


private _camDefinitions = [
    ["FREE", getPos introCamPos1, getPos introCamPos2, introCamTarget1, introCamTarget2, 50, 0, 0.4, 0.2, [0,0,0], [0,0,0]],
    ["FREE", getPos introCamPos2, getPos introCamPos3, introCamTarget2, introCamTarget2, 30, 0, 0.2, 0.2, [0,0,0], [0,0,0]],
    ["FREE", getPos introCamPos3, getPos introCamPos4, introCamTarget2, introCamTarget3, 30, 0, 0.2, 0.4, [0,0,0], [0,0,0]],
    ["FREE", getPos introCamPos4, getPos introCamPos5, introCamTarget3, introCamTarget4, 20, 0, 0.4, 0.3, [0,0,0], [0,0,0], 10]
];

/////// dont edit below

{
  	[_x] call GRAD_introCam_fnc_addShot;
} forEach _camDefinitions;



[{
    if (isMultiplayer) then {
        call GRAD_introCam_fnc_init;
    };
}, [], 5] call CBA_fnc_waitAndExecute;

[{
    [getPos introCamTarget4, getPos introCamPos5, 3, "slow", 30] call HS_spawner_fnc_spawnCiviliansCrowd;
}, [], 110] call CBA_fnc_waitAndExecute;


[{
    BRIEFING_DONE = true;
}, [], 63] call CBA_fnc_waitAndExecute;
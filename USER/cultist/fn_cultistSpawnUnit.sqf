params ["_position", "_type"];


private _dummy =  createVehicle ["Land_ClutterCutter_medium_F", _position, [], 0, "CAN_COLLIDE"];
[_dummy, "teleport_global"] remoteExec ["say3D"];

[{
    params ["_position", "_dummy", "_type"];

    private _classname = [_type] call grad_cultist_fnc_cultistSpawnGetclassname;

    [_position] remoteExec ["grad_cultist_fnc_cultistSpawnFX_spawnFlash"];

    private _grp = creategroup east; // hardcoded for now
    private _unit = _grp createUnit [_classname, _position, [], 0, "CAN_COLLIDE"];
    [_unit, "AmovPercMstpSnonWnonDnon_SaluteOut"] remoteExec ["switchmove", 0];
    _unit setVariable ["lambs_danger_disableAI", true];  

    _grp deleteGroupWhenEmpty true;
    _unit setDir (getDir player + 90);

    // _unit setVariable ["isCultist", true, true];

    /*
    if (_type == "zombie") then {
        [_unit] call grad_ambient_fnc_zombieRandomize;
    };
    */

    ["grad_missionControl_curatorInfo", [_type]] call CBA_fnc_globalEvent;

    [_unit] remoteExec ["grad_cultist_fnc_cultistZombieHitPart", 0, _unit];

    [_dummy, ["teleport_end",500]] remoteExec ["say3D"];

}, [_position, _dummy, _type], 1] call CBA_fnc_waitAndExecute;

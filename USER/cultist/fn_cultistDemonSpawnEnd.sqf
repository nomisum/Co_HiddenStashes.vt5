params ["_player1", "_player2", "_position", "_id"];


_player1 setVariable ["cultist_manaDrain", false, true];
_player2 setVariable ["cultist_manaDrain", false, true];

private _dummy = "Land_ClutterCutter_medium_F" createVehicle _position;
[_dummy, "teleport_global"] remoteExec ["say3D"];


[{
    params ["_position", "_dummy"];

    [_position] remoteExec ["grad_cultist_fnc_cultistSpawnFX"];
    private _demon = (createGroup east) createUnit ["dev_toxmut_o", _position, [], 0, "NONE"];

    [_dummy, "teleport_global"] remoteExec ["say3D"];

    [{
        params ["_dummy"];
        [_dummy, "teleport_end"] remoteExec ["say3D"];
    }, [_dummy], 3] call CBA_fnc_waitAndExecute;

}, [_position, _dummy], 5] call CBA_fnc_waitAndExecute;

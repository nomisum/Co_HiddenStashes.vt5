params ["_unit", "_type"];

_unit setVariable ["cultist_manaDrain", true, true];

[_unit, "Acts_JetsMarshallingStop_loop"] remoteExec ["switchMove"];

[{
    animationState _this != "Acts_JetsMarshallingStop_loop"
},{
  _this setVariable ["cultist_manaDrain", false, true];
}, _unit] call CBA_fnc_waitUntilAndExecute;


private _buddy = _unit getVariable ["grad_missionControl_buddy", objNull];

if (isNull _buddy) exitWith {
     ["You dont have a soulmate / buddy unfortunately :/"] call CBA_fnc_notify;
};

if (_unit distance _buddy > 8) exitWith {
     ["Your buddy is too far away for successful incantation"] call CBA_fnc_notify;
};

if (_unit distance _buddy < 2) exitWith {
    ["Your buddy is too close for successful incantation"] call CBA_fnc_notify;
};

private _posPlayer = getPos _unit;
private _posBuddy = getPos _buddy;

if ([_posPlayer, getDir _unit, 90, _posBuddy] call BIS_fnc_inAngleSector &&
    [_posBuddy, getDir _buddy, 90, _posPlayer] call BIS_fnc_inAngleSector) exitWith {
        ["Your buddy needs to perform ritual too."] call CBA_fnc_notify;

        if (_buddy getVariable ["cultist_manaDrain", false]) then {
            ["grad_cultistSpawnBuddy", [_unit, _buddy, _type]] call CBA_fnc_serverEvent;
        };
};

["you and your buddy dont look at each other"] call CBA_fnc_notify;

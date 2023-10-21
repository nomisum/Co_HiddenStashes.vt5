params ["_unit", "_type"];

_unit setVariable ["cultist_manaDrain", true, true];

[_unit, "Acts_JetsMarshallingStop_loop"] remoteExec ["switchMove"];

[{
    animationState _this != "Acts_JetsMarshallingStop_loop"
},{
    _this setVariable ["cultist_manaDrain", false, true];
}, _unit] call CBA_fnc_waitUntilAndExecute;


["grad_cultistSpawnMulti", [_unit, _type]] call CBA_fnc_serverEvent;

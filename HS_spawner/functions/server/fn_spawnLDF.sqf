params ["_position", ["_type", "random"], ["_radius", 0]];

private _uniform = "GRAD_SoldierZed_Oversuit_blue";
private _classname = _uniform;

switch (_type) do { 
    case "random" : {
        private _format = format ["%1", selectRandom ["_slow", "_walker", "_crawler", "", "_spider"]];
        _classname = (_uniform + _format);
    };
    case "slow" : {
        private _format = format ["%1", "_slow"];
        _classname = (_uniform + _format);
    };
    case "walker" : {
        private _format = format ["%1", "_walker"];
        _classname = (_uniform + _format);
    };
    case "crawler" : {
        private _format = format ["%1", "_crawler"];
        _classname = (_uniform + _format);
    };
    case "fast" : {
        private _format = format ["%1", ""];
        _classname = (_uniform + _format);
    };
     case "spider" : {
        private _format = format ["%1", "_spider"];
        _classname = (_uniform + _format);
    };
    default {};
};

// hint (_classname + "   " + str _position);



private _zombie = grad_globalzombiegroup createUnit [_classname, _position, [], _radius, "NONE"];
[_zombie] call HS_spawner_fnc_loadoutLDF;
[_zombie] call HS_spawner_fnc_zombieInit;
_zombie setposATL [(getposATL _zombie select 0), (getposATL _zombie select 1), 0];
[_zombie, "AmovPercMstpSnonWnonDnon_SaluteOut"] remoteExec ["switchmove", 0];

// _zombie setVariable ["suomen_smells", true];
// _zombie playMoveNow "AmovPercMstpSnonWnonDnon_SaluteOut";


_zombie
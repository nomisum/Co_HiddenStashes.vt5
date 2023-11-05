params ["_position", ["_type", "random"]];

private _uniform = "GRAD_SoldierZed_Oversuit_white";
private _classname = _uniform; // default

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
        private _format = format ["%1", ""]; // fast has no ending?
        _classname = (_uniform + _format);
    };
    case "spider" : {
        private _format = format ["%1", "_spider"];
        _classname = (_uniform + _format);
    };
    default {};
};

// hint (_classname + "   " + str _position);

// systemChat (_classname + " " + str _position + " " + str _type + " " + str _radius);

private _zombie = grad_globalzombiegroup createUnit [_classname, _position, [], 0, "NONE"];
[_zombie] call HS_spawner_fnc_zombieInit;
[_zombie] call HS_spawner_fnc_equipWithGasmask;

_zombie setposATL [(getposATL _zombie select 0), (getposATL _zombie select 1), 0];
// _zombie setVariable ["suomen_smells", true];

_zombie
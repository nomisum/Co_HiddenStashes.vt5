params ["_car"];

_car addAction [
    "<t color='#333399'>Warnlicht AN</t>", {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _target setVariable ["GRAD_offroadOrangeLight", true, true];
        [_target] remoteExec ["wita_offroadLight_fnc_orangeLight", 0, false];
    },
    [],
    1.5, 
    true, 
    true, 
    "",
    "!(_originalTarget getVariable ['GRAD_offroadOrangeLight', false]) && (_this == driver _originalTarget)",
    4,
    false,
    "",
    ""
];

_car addAction [
    "<t color='#333399'>Warnlicht AUS</t>", {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _target setVariable ["GRAD_offroadOrangeLight", false, true];
    },
    [],
    1.5, 
    true, 
    true, 
    "",
    "(_originalTarget getVariable ['GRAD_offroadOrangeLight', false]) && (_this == driver _originalTarget)",
    4,
    false,
    "",
    ""
];
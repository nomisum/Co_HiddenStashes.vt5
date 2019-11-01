#include "component.hpp"

params ["_object"];

[
    _object,
    "blu_ldf",
    _object,
    _object,
    "COMMAND CENTER",
    "Buy",
    {side (_this select 1) == INDEPENDENT && alive (_this select 0)},
    [0.45,-0.63,-0.75],
    5,
    [],
    INDEPENDENT
] call grad_lbm_fnc_addInteraction;
params ["_unit"];

[{
    params ["_unit"];
    
    _unit addGoggles (["G_AirPurifyingRespirator_01_F", "gm_ge_facewear_m65"] select (side _unit == east));

}, [_unit], 3] call CBA_fnc_waitAndExecute;
params ["_unit"];

[{
    params ["_unit"];
    
    _unit addGoggles (["Mask_M50", "gm_ge_facewear_m65"] select (side _x == east));

}, [_unit], 3] call CBA_fnc_waitAndExecute;
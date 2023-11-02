if (!isServer) exitWith {};

[
    independent, 
    ["ind_task1"], 
    ["Visit police station", "Police Station", ""], 
    getMarkerPos "mrk_policestation",
    1, 
    2, 
    true
] call BIS_fnc_taskCreate;
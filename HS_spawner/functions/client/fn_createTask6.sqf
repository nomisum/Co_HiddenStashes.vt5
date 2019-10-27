[ 
    "ind_task5",
    independent 
] call BIS_fnc_deleteTask;

[
    independent, 
    ["ind_task6"], 
    ["Flugzeug finden und flüchten", "Flüchten", ""], 
    getMarkerPos "mrk_escapeplane",
    1, 
    2, 
    true
] call BIS_fnc_taskCreate;
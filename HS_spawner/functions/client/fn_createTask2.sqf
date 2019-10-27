[ 
    "ind_task1",
    independent 
] call BIS_fnc_deleteTask;

[
    independent, 
    ["ind_task2"], 
    ["Krankenhaus aufsuchen", "Krankenhaus", ""], 
    getMarkerPos "mrk_hospital",
    1, 
    2, 
    true
] call BIS_fnc_taskCreate;
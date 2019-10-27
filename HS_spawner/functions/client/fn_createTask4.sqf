[ 
    "ind_task3",
    independent 
] call BIS_fnc_deleteTask;

[
    independent, 
    ["ind_task4"], 
    ["Schrottplatz aufsuchen", "Schrottplatz", ""], 
    getMarkerPos "mrk_scrapyard",
    1, 
    2, 
    true
] call BIS_fnc_taskCreate;
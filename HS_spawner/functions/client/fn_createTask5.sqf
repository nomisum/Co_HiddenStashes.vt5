[ 
    "ind_task4",
    independent 
] call BIS_fnc_deleteTask;

[
    independent, 
    ["ind_task5"], 
    ["Verstrahltes Material finden und zum Schrottplatz bringen", "Verstrahltes finden", ""], 
    objNull,
    1, 
    2, 
    true
] call BIS_fnc_taskCreate;
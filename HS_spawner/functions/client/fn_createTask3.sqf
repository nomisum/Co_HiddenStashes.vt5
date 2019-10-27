if (!isServer) exitWith {};
	
[ 
    "ind_task2",
    independent 
] call BIS_fnc_deleteTask;

[
    independent, 
    ["ind_task3"], 
    ["Friedhof aufsuchen", "Friedhof", ""], 
    getMarkerPos "mrk_graveyard",
    1, 
    2, 
    true
] call BIS_fnc_taskCreate;
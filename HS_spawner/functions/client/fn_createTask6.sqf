if (!isServer) exitWith {};
	
[ 
    "ind_task5",
    independent 
] call BIS_fnc_deleteTask;

[
    independent, 
    ["ind_task6"], 
    ["Find a plane and get out", "Flee", ""], 
    getMarkerPos "mrk_escapeplane",
    1, 
    2, 
    true
] call BIS_fnc_taskCreate;
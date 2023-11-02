if (!isServer) exitWith {};
	
[ 
    "ind_task1",
    independent 
] call BIS_fnc_deleteTask;

[
    independent, 
    ["ind_task2"], 
    ["Visit hospital to search for CBRN equipment.", "Hospital", ""], 
    getMarkerPos "mrk_hospital",
    1, 
    2, 
    true
] call BIS_fnc_taskCreate;
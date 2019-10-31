if (!isServer) exitWith {};
	
[ 
    "ind_task1",
    independent 
] call BIS_fnc_deleteTask;

[
    independent, 
    ["ind_task2"], 
    ["Krankenhaus aufsuchen und CBRN Equipment suchen.", "Krankenhaus", ""], 
    getMarkerPos "mrk_hospital",
    1, 
    2, 
    true
] call BIS_fnc_taskCreate;
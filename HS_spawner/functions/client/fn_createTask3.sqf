if (!isServer) exitWith {};
	
[ 
    "ind_task2",
    independent 
] call BIS_fnc_deleteTask;

[
    independent, 
    ["ind_task3"], 
    ["Visit the graveyard for some interesting loot.", "Graveyard", ""], 
    getMarkerPos "mrk_graveyard",
    1, 
    2, 
    true
] call BIS_fnc_taskCreate;
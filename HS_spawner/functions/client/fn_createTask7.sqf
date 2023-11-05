if (!isServer) exitWith {};

/*	
[ 
    "ind_task5",
    independent 
] call BIS_fnc_deleteTask;
*/

[
    independent, 
    ["ind_task7"], 
    ["Find Ammo Storage", "Ammo Storage", ""], 
    getMarkerPos "mrk_militarybase",
    1, 
    2, 
    true
] call BIS_fnc_taskCreate;
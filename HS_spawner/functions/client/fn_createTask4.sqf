if (!isServer) exitWith {};
	
[ 
    "ind_task3",
    independent 
] call BIS_fnc_deleteTask;


"radioTransmision" remoteExecCall ["playSound", independent];

[{
    [
        independent, 
        ["ind_task4"], 
        ["Schrottplatz aufsuchen", "Schrottplatz", ""], 
        getMarkerPos "mrk_scrapyard",
        1, 
        2, 
        true
    ] call BIS_fnc_taskCreate;

}, [], 20] call CBA_fnc_waitAndExecute;
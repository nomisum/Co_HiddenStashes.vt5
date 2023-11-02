if (!isServer) exitWith {};
	
[ 
    "ind_task4",
    independent 
] call BIS_fnc_deleteTask;

[
    independent, 
    ["ind_task5"], 
    ["Find radioactive material and bring it to Igor", "Find radioactive material", ""], 
    objNull,
    1, 
    2, 
    true
] call BIS_fnc_taskCreate;
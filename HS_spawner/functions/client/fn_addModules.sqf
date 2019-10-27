if (!hasInterface) exitWith {};

["HS_Spawner", "Civilian Z Group", {

    params ["_position", "_object"];

        ["HS Spawner", [
            [
                "COMBO", 
                ["Pick Speed", ""], [
                [
                    "random", "slow","crawler","walker","fast","spider"
                ], [
                    ["Random", "Random"],
                    ["Slow", "Slow"],
                    ["Crawler", "Crawler"],
                    ["Walker", "Walker"],
                    ["Fast", "Fast"],
                    ["Spider", "Spider"]
            ], 0], true],
            [
                "COMBO", 
                ["Count", ""], [
                [
                    1,3,6,9,12,15,18,21
                ], [
                    ["1", "1"],
                    ["3", "3"],
                    ["6", "6"],
                    ["9", "9"],
                    ["12", "12"],
                    ["15", "15"],
                    ["18", "18"],
                    ["21", "21"]
            ], 0], true]
        ], {
            params ["_dialogValues", "_args"];
            _args params ["_position"];

            _dialogValues params ["_speed", "_count"];

            // hint str _position;

            ["HS_SpawnerRandomCivilian", [_position, [], 5, _speed, _count]] call CBA_fnc_globalEvent;
            
        }, {hint "aborted";}, [_position]] call zen_dialog_fnc_create;

}] call zen_custom_modules_fnc_register;


["HS_Spawner", "Russian Z Group", {

    params ["_position", "_object"];

        ["HS Spawner", [
            [
                "COMBO", 
                ["Pick Speed", ""], [
                [
                    "random", "slow","crawler","walker","fast"
                ], [
                    ["Random", "Random"],
                    ["Slow", "Slow"],
                    ["Crawler", "Crawler"],
                    ["Walker", "Walker"],
                    ["Fast", "Fast"],
                    ["Spider", "Spider"]
            ], 0], true]
        ], {
            params ["_dialogValues", "_args"];
            _args params ["_position"];

            _dialogValues params ["_speed"];

            // hint str _position;

            ["HS_SpawnerRandomRussian", [_position, _speed]] call CBA_fnc_globalEvent;
            
        }, {hint "aborted";}, [_position]] call zen_dialog_fnc_create;

}] call zen_custom_modules_fnc_register;

["HS_Spawner", "LDF Z Group", {

    params ["_position", "_object"];

        ["HS Spawner", [
            [
                "COMBO", 
                ["Pick Speed", ""], [
                [
                    "random", "slow","crawler","walker","fast"
                ], [
                    ["Random", "Random"],
                    ["Slow", "Slow"],
                    ["Crawler", "Crawler"],
                    ["Walker", "Walker"],
                    ["Fast", "Fast"],
                    ["Spider", "Spider"]
            ], 0], true]
        ], {
            params ["_dialogValues", "_args"];
            _args params ["_position"];

            _dialogValues params ["_speed"];

            // hint str _position;

            ["HS_SpawnerRandomLDF", [_position, _speed]] call CBA_fnc_globalEvent;
            
        }, {hint "aborted";}, [_position]] call zen_dialog_fnc_create;

}] call zen_custom_modules_fnc_register;



["HS_Spawner", "Single Civilian", {

    params ["_position", "_object"];

        ["HS Spawner", [
            [
                "COMBO", 
                ["Pick Speed", ""], [
                [
                    "random", "slow","crawler","walker","fast","spider"
                ], [
                    ["Random", "Random"],
                    ["Slow", "Slow"],
                    ["Crawler", "Crawler"],
                    ["Walker", "Walker"],
                    ["Fast", "Fast"],
                    ["Spider", "Spider"]
            ], 0], true]
        ], {
            params ["_dialogValues", "_args"];
            _args params ["_position"];

            _dialogValues params ["_speed"];

            // hint str _position;

            [_position, _speed] call HS_spawner_fnc_spawnLDF;
            ["HS_SpawnerRandomLDF", [_position, _speed]] call CBA_fnc_globalEvent;
            
        }, {hint "aborted";}, [_position]] call zen_dialog_fnc_create;

}] call zen_custom_modules_fnc_register;

["HS_BluforBuyOptions", "Allow APC", {
    params ["_position", "_object"];

    {[player, 1] call grad_lbm_fnc_setPermissionLevel} remoteExec ["call",WEST,true];
    ["wita_notification",["VEHICLES UNLOCKED","BLUFOR now has access to lvl 1 vehicles."]] remoteExec ["bis_fnc_showNotification",west,false];
    systemChat "level 1 unlocked";

}] call zen_custom_modules_fnc_register;

["HS_BluforBuyOptions", "Allow Heli", {
    params ["_position", "_object"];

    {[player, 2] call grad_lbm_fnc_setPermissionLevel} remoteExec ["call",WEST,true];
    ["wita_notification",["VEHICLES UNLOCKED","BLUFOR now has access to lvl 2 vehicles."]] remoteExec ["bis_fnc_showNotification",west,false];
    systemChat "level 2 unlocked";

}] call zen_custom_modules_fnc_register;


["HS_Tasks_Independent", "Task 1 (Polizeistation)", {
    params ["_position", "_object"];

    [] remoteExecCall ["HS_spawner_fnc_createTask1",2];

}] call zen_custom_modules_fnc_register;

["HS_Tasks_Independent", "Task 2 (Hospital)", {
    params ["_position", "_object"];

    [] remoteExecCall ["HS_spawner_fnc_createTask2",2];

}] call zen_custom_modules_fnc_register;

["HS_Tasks_Independent", "Task 3 (Friedhof)", {
    params ["_position", "_object"];

    [] remoteExecCall ["HS_spawner_fnc_createTask3",2];

}] call zen_custom_modules_fnc_register;

["HS_Tasks_Independent", "Task 4 (Schrottplatz)", {
    params ["_position", "_object"];

    [] remoteExecCall ["HS_spawner_fnc_createTask4",2];

}] call zen_custom_modules_fnc_register;

["HS_Tasks_Independent", "Task 5 (AKW Müll)", {
    params ["_position", "_object"];

    [] remoteExecCall ["HS_spawner_fnc_createTask5",2];

}] call zen_custom_modules_fnc_register;

["HS_Tasks_Independent", "Task 6 (Flugzeug)", {
    params ["_position", "_object"];

    [] remoteExecCall ["HS_spawner_fnc_createTask6",2];

}] call zen_custom_modules_fnc_register;






{
    _x addEventHandler ["CuratorWaypointPlaced", {
        params ["_curator", "_group", "_waypointID"];

        private _unit = ((units _group) select 0);
        private _position = waypointPosition [_group, _waypointID];

        if (_unit isKindOf "RyanZombieCivilian_F")  then {
            if !(local _zombie) then 
            {
                [_zombie, _position] remoteExecCall ["fnc_RyanZombies_DoMoveLocalized"];
            } else {
                _zombie domove _position;
            }; 
        };
    }];
} forEach  allCurators;


/*
_dialogValues params ["_speed", "_args"];

           
            
            ["GRAD_sandstorm_parametersEdited", [_args, _speed ]] call CBA_fnc_globalEvent;


systemChat str _args;
            private _position = _args;
            _values params ["_speed"];
            ["HS_SpawnerRandomCivilian", [_position, _speed]] call CBA_fnc_globalEvent;




["HS_Spawner", "Spawn Random Civilian TEST", {

    private _args = _this;
    systemChat str _this;


}] call zen_custom_modules_fnc_register;

*/
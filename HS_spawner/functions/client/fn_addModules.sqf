if (!hasInterface) exitWith {};

["HS_Spawner", "Spawn Random Single Civilian Z", {

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
                    ["Fast", "Fast"]
            ], 0], true]
        ], {
            params ["_dialogValues", "_args"];
            _args params ["_position"];

            _dialogValues params ["_speed"];

            hint str _position;

            ["HS_SpawnerRandomCivilian", [_position, _speed]] call CBA_fnc_globalEvent;
            
        }, {hint "aborted";}, [_position]] call zen_dialog_fnc_create;

}] call zen_custom_modules_fnc_register;


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
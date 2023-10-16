
["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

player addEventHandler ["HandleRating",{0}];
player addEventHandler ["Take",{_this call wita_common_fnc_handleScopeChange}];

if (isMultiplayer && !didJIP) then {
    titleText ["","BLACK FADED",999];
    0 fadeSound 0;
    [0] call acre_api_fnc_setGlobalVolume;
};

if (didJIP) then {
    waitUntil {
      !isNull player
    };
    sleep 1;
    10 fadeSound 1;
    titleText ["", "BLACK IN", 0];
    player setVariable ["tf_voiceVolume", 1, true];
    // [1] call acre_api_fnc_setGlobalVolume;
    if (isMultiplayer) then {
        [true] call cbrn_fnc_init;
    };
};

player setVariable ["originalSide", "INDEPENDENT", true];
0 enableChannel false;
// [true, true] call acre_api_fnc_setupMission;

// init babel after variables are set in init
// [ [west, "English", "French"], [east, "Russian"], [civilian, "French"] ] call acre_api_fnc_babelSetupMission;

// ["en","English"] call acre_api_fnc_babelAddLanguageType;
// ["fi","Finnish"] call acre_api_fnc_babelAddLanguageType;
// ["ru","Russian"] call acre_api_fnc_babelAddLanguageType;

/*
[ 
    [west, "English"],
    [independent, "Finnish"],
    [east, "Russian"], 
    [civilian, "Russian"]
] call acre_api_fnc_babelSetupMission;


[{
        


        if (player getVariable ["HS_isTranslator", false]) then {
            ["fi", "ru", "en"] call acre_api_fnc_babelSetSpokenLanguages;
            // systemChat "Du sprichst Englisch, Finnisch und Russisch fließend";
        } else {
            ["fi"] call acre_api_fnc_babelSetSpokenLanguages;
        };
}, [], 30] call CBA_fnc_waitAndExecute;
*/

player setVehiclePosition [getMarkerPos "mrk_independent_hq", [], 10];
player setDir (player getRelDir getMarkerPos "mrk_independent_hq");


["group", {
    params ["_unit", "_oldGroup"];
    private _newGroup = group _unit;
    
    {
        if (side _x == independent) then {
            _x setVariable ["ace_map_hideBlueForceMarker", true];
        } else {
            _x setVariable ["ace_map_hideBlueForceMarker", false];
        };
    } forEach allGroups;
}, true] call CBA_fnc_addPlayerEventHandler;

["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

player addEventHandler ["HandleRating",{0}];

if (isMultiplayer && !didJIP) then {
    titleText ["","BLACK FADED",999];
    0 fadeSound 0;
    [0] call acre_api_fnc_setGlobalVolume;
};

private _skipIntro = (["SKIP_INTRO", 0] call BIS_fnc_getParamValue) == 1;

if (didJIP || _skipIntro) then {
    waitUntil {
      !isNull player
    };
    [] spawn {
        sleep 1;
        10 fadeSound 1;
        titleText ["", "BLACK IN", 0];
        // player setVariable ["tf_voiceVolume", 1, true];
        [1] call acre_api_fnc_setGlobalVolume;
        if (isMultiplayer) then {
            [true] call cbrn_fnc_init;
        };
    };
};

player setVariable ["originalSide", "INDEPENDENT", true];
0 enableChannel false;
[true, true] call acre_api_fnc_setupMission;


["en","English"] call acre_api_fnc_babelAddLanguageType;
["fi","Finnish"] call acre_api_fnc_babelAddLanguageType;
["ru","Russian"] call acre_api_fnc_babelAddLanguageType;
["cu","Cultist"] call acre_api_fnc_babelAddLanguageType;


[ 
    [west, "English"],
    [independent, "Finnish"],
    [east, "Russian"], 
    [civilian, "Russian"]
] call acre_api_fnc_babelSetupMission;


[{
    ["fi"] call acre_api_fnc_babelSetSpokenLanguages;    
}, [], 30] call CBA_fnc_waitAndExecute;


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
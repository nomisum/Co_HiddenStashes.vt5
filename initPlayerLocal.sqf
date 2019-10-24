["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

player addEventHandler ["HandleRating",{0}];
player addEventHandler ["Take",{_this call wita_common_fnc_handleScopeChange}];

if (isMultiplayer && !didJIP) then {
    titleText ["","BLACK FADED",999];
    0 fadeSound 0;
};

if (didJIP) then {
    waitUntil {
      !isNull player
    };
    sleep 1;
    10 fadeSound 1;
    titleText ["", "BLACK IN", 0];
    player setVariable ["tf_voiceVolume", 1, true];
};

[true, true] call acre_api_fnc_setupMission;
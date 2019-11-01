#include "component.hpp"

params ["_indepPos","_bluforPos"];

// [_indepPos,INDEPENDENT] call wita_setup_fnc_teleportSide;
// [_bluforPos,INDEPENDENT] call wita_setup_fnc_teleportSide;

[INDEPENDENT] call wita_setup_fnc_setMoney;
// [] call wita_setup_fnc_createTasks;
[] call wita_mission_fnc_unlockBluforVehicles;

[{missionNamespace getVariable ["CBA_missionTime",0] > 10}, {[] call wita_endings_fnc_checkIndep}, []] call CBA_fnc_waitUntilAndExecute;
[{
    missionNamespace setVariable ["WITA_TRACKINGSTARTED",true,true];
    {if ([_x] call wita_common_fnc_isAgent) then {[_x] call wita_mission_fnc_agentMarker}; false} count (playableUnits + switchableUnits);
}, [], [missionConfigFile >> "cfgMission","timeBeforeFirstTrack",0] call BIS_fnc_returnConfigEntry] call CBA_fnc_waitAndExecute;

missionNamespace setVariable ["WITA_GAMESTARTED",true,true];
missionNamespace setVariable ["WITA_GAMESTARTTIME",CBA_missionTime,true];

INFO("Game started.");

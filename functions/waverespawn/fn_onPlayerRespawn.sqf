#include "component.hpp"

private ["_pos"];

[player,PLAYERSIDE] remoteExec ["wita_waverespawn_fnc_removeFromWave",2,false];

openMap [false, false];
[false] call wita_waverespawn_fnc_blockMap;
["Terminate"] call BIS_fnc_EGSpectator;

(findDisplay 46) displayRemoveEventHandler ["KeyUp", missionNamespace getVariable ["mcd_onRespawnKeyDown",-1]];

// [false] call acre_api_fnc_setSpectator;
// [player, false] call TFAR_fnc_forceSpectator;
// 30 call TFAR_fnc_setVoiceVolume;

setPlayerRespawnTime 99999;
player enableSimulation true;
hint "";

[] call wita_waverespawn_fnc_resetPlayerVars;
[PLAYERSIDE] call wita_waverespawn_fnc_respawnSelectorMarker;

[player] joinSilent (createGroup west);
execVM "custom\loadout\equipAsSpecialForce.sqf";
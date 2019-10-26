// dont display for JIP
if (didJIP) exitWith {};
waitUntil {!isNull player};
waitUntil {time > 0};
player setVariable ["tf_voiceVolume", 0, true];
STHud_UIMode = 0;
diwako_dui_main_toggled_off = true;

[] spawn GRAD_introCam_fnc_textEffects;
player action ["WeaponOnBack", player];

private _shots = missionNamespace getVariable ["GRAD_INTROCAM_SHOTS", []];

private _count = count _shots;
{
  	[_x, _forEachIndex] call GRAD_introCam_fnc_camCommands;
} forEach _shots;


cutText [" ", "BLACK IN", 3];
private _camera = "camera" camCreate (getpos player);
_camera cameraeffect ["terminate", "back"];
camDestroy _camera;




titleText ["", "BLACK IN", 0];
player setVariable ["tf_voiceVolume", 1, true];

STHud_UIMode = 1;
diwako_dui_main_toggled_off = false;

10 fadeSound 0;
sleep 10;

playSound "";
10 fadeSound 1;

[true] call cbrn_fnc_init;
["cba_events_loadoutEvent", [player, getUnitLoadout player]] call CBA_fnc_localEvent; // fake event to trigger gasmask stuff
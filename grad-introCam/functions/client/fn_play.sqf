// dont display for JIP
if (didJIP) exitWith {};
waitUntil {!isNull player};
waitUntil {time > 0};
player setVariable ["tf_voiceVolume", 0, true];
diwako_dui_main_toggled_off = true;

[] spawn GRAD_introCam_fnc_textEffects;

private _shots = missionNamespace getVariable ["GRAD_INTROCAM_SHOTS", []];

private _count = count _shots;
{
  	[_x, _forEachIndex] call GRAD_introCam_fnc_camCommands;
} forEach _shots;


cutText [" ", "BLACK IN", 3];
private _camera = "camera" camCreate (getpos player);
_camera cameraeffect ["terminate", "back"];
camDestroy _camera;

STHud_UIMode = 1;

10 fadeSound 1;
titleText ["", "BLACK IN", 0];
player setVariable ["tf_voiceVolume", 1, true];
diwako_dui_main_toggled_off = false;

call cbrn_fnc_init;
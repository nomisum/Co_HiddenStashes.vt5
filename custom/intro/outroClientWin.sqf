params ["_vehicle", "_targetPos", "_zombie", "_isLost"];

cutText ["","BLACK OUT", 5];
sleep 5;

setViewDistance 3500;
setObjectViewDistance 3000;
// remove mask overlay and breathing sounds
player setVariable ["cbrn_mask_on", false, true];
cbrn_mask_abberation ppEffectEnable true;
cbrn_mask_abberation ppEffectAdjust [0,0,true];
cbrn_mask_abberation ppEffectCommit 1;
"cbrn_gasmask_overlay" cutFadeOut 1;
terminate cbrn_breath_handle;

// clear any CBRN zones for outro
player setVariable ["cbrn_zones", []];

cutText ["","BLACK IN", 5];

playSound "outro";

private _camPos1 = (_vehicle getPos [1000,180]);
_camPos1 set [2,30];

private _camera = "camera" camCreate _camPos1;
showCinemaBorder true;
_camera cameraEffect ["internal", "BACK"];
_camera camCommand "inertia on";
_camera camPrepareTarget _vehicle;
_camera camPrepareFOV 0.2;
_camera camCommitPrepared 0;

// poz 2 - where camera is moving next - target2
private _fighting = (_zombie getPos [100,180]);
_fighting set [2,50];
_camera camPreparePos _fighting;
_camera camPrepareTarget _zombie;
_camera camPrepareFOV 0.3;

_camera camCommitPrepared 20;

sleep 20;

_camera camPreparePos _targetPos;
_camera camPrepareTarget _vehicle;
_camera camPrepareFOV 0.1;

_camera camCommitPrepared 20;

sleep 15;

private _ctrlTWO = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
_ctrlTWO ctrlSetPosition [ 
    safeZoneX + safeZoneW/2 - safeZoneW/2, 
    (safezoneY + safeZoneH)/5 + (safezoneY + safeZoneH)/8.5, 
    safezoneWAbs, 
    safeZoneH/10
];


_ctrlTWO ctrlSetStructuredText parseText "<t size='1' shadow='0' font='EtelkaMonospaceProBold' align='center' color='#ffffffff'>Mission erfolgreich!</t>";
_ctrlTWO ctrlSetBackgroundColor [0, 0, 0, 0]; 
_ctrlTWO ctrlSetFade 1;
_ctrlTWO ctrlCommit 0;

[_ctrlTWO, 1.2, 5] spawn BIS_fnc_ctrlSetScale;

_ctrlTWO ctrlSetFade 0;
_ctrlTWO ctrlCommit 3;

sleep 10;

_ctrlTWO ctrlSetStructuredText parseText "<t size='1' shadow='0' font='EtelkaMonospaceProBold' align='center' color='#ffffffff'>Erfolgreiche Flucht! Überlebende Rebellen: </t>";
_ctrlTWO ctrlSetBackgroundColor [0, 0, 0, 0]; 
_ctrlTWO ctrlSetFade 1;
_ctrlTWO ctrlCommit 0;

[_ctrlTWO, 1.2, 5] spawn BIS_fnc_ctrlSetScale;

_ctrlTWO ctrlSetFade 0;
_ctrlTWO ctrlCommit 3;

sleep 10;

private _playerNames = "";

{
    if (_forEachIndex == 0) then {
        if (side _x == independent) then {
            _playerNames = (name _x);
        };
    } else {
        if (side _x == independent) then {
            _playerNames = _playerNames + ", " + (name _x);
        };
    };
} forEach allPlayers;

_ctrlTWO ctrlSetStructuredText parseText ("<t size='1' shadow='0' font='EtelkaMonospaceProBold' align='center' color='#ffffffff'>" + _playerNames + "</t>");
_ctrlTWO ctrlSetBackgroundColor [0, 0, 0, 0]; 
_ctrlTWO ctrlSetFade 1;
_ctrlTWO ctrlCommit 0;

[_ctrlTWO, 1.2, 5] spawn BIS_fnc_ctrlSetScale;

_ctrlTWO ctrlSetFade 0;
_ctrlTWO ctrlCommit 3;

sleep 20;

10 fadeSound 0;

["end1", true, 10] call BIS_fnc_endMission;
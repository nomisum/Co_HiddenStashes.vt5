params ["_vehicle"];

cutText ["","BLACK OUT", 5];
sleep 5;
setViewDistance 2500;
setObjectViewDistance 2000;

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



private _camPos1 = (player getPos [1000,180]);
_camPos1 set [2,30];

private _camera = "camera" camCreate _camPos1;
showCinemaBorder true;
_camera cameraEffect ["internal", "BACK"];
_camera camCommand "inertia on";
_camera camPrepareTarget _vehicle;
_camera camPrepareFOV 0.2;
_camera camCommitPrepared 0;

// poz 2 - where camera is moving next - target2
private _fighting = (_vehicle getPos [100,180]);
_fighting set [2,50];
_camera camPreparePos _fighting;
_camera camPrepareTarget _vehicle;
_camera camPrepareFOV 0.3;

_camera camCommitPrepared 20;

sleep 20;

private _camPos2 = (_vehicle getPos [200,90]);
_camPos2 set [2,100];

_camera camPreparePos _camPos2;
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

private _camPos3 = (_vehicle getPos [200,270]);
_camPos3 set [2,500];

_camera camPreparePos _camPos3;
_camera camPrepareTarget _vehicle;
_camera camPrepareFOV 0.2;

_camera camCommitPrepared 40;

sleep 10;

_ctrlTWO ctrlSetStructuredText parseText "<t size='1' shadow='0' font='EtelkaMonospaceProBold' align='center' color='#ffffffff'>In Gedenken an die finnischen Helden 03.08.2015 / 23.10.2017:</t>";
_ctrlTWO ctrlSetBackgroundColor [0, 0, 0, 0]; 
_ctrlTWO ctrlSetFade 1;
_ctrlTWO ctrlCommit 0;

[_ctrlTWO, 1.2, 5] spawn BIS_fnc_ctrlSetScale;

_ctrlTWO ctrlSetFade 0;
_ctrlTWO ctrlCommit 3;

sleep 10;

_ctrlTWO ctrlSetStructuredText parseText "<t size='0.7' shadow='0' font='EtelkaMonospaceProBold' align='center' color='#ffffffff'>
Alpha-Kilo,
Ainer,
B4dHorse,
bloody,
Bobby,
BountyHuntA,
dave,
DerZade,
fraggi,
Fridelcastro,<br/>
form,
Fusselwurm,
Grumbert23,
Jason-Miles,
Jojo,
Lord-DK,
McDiod,
nomisum,
Odin,
Panda,<br/>
Promi,
Rigged,
Salbei,
Shockwave,
Shura,
Simmax,
Slant,
Smile,
Synch,
Stefan,<br/>
Xenon,
Timeout,
thimotius,
XiviD,
Zarrck,
zuck</t>";
_ctrlTWO ctrlSetBackgroundColor [0, 0, 0, 0]; 
_ctrlTWO ctrlSetFade 1;
_ctrlTWO ctrlCommit 0;

[_ctrlTWO, 1.2, 5] spawn BIS_fnc_ctrlSetScale;

_ctrlTWO ctrlSetFade 0;
_ctrlTWO ctrlCommit 3;

sleep 20;

10 fadeSound 0;

["end1", false, 10] call BIS_fnc_endMission;
/*
["Вот что командир Владивостока Михаил Цаплин. Его задача состоит в сохранении K-137 Красный Oktabr шедший пред абхазскому побережью свое и не может возникнуть сама по себе. Обеспечить при любых обстоятельствах, что ни абхазские силы не приближается подводную лодку. Успешная заявка маловероятно после наступления темноты, так что вам не терять время.",
"Hier spricht der Kommandant der Vladivostok, Mikhail Tsaplin. Ihr Auftrag ist es, die K-137 Krasny Oktabr zu sichern, die vor der abchasischen Küste auf Grund gelaufen ist und nicht aus eigener Kraft auftauchen kann. Stellen Sie unter allen Umständen sicher, dass sich keine abchasischen Kräfte dem U-Boot nähern. Ein erfolgreicher Einsatz wird nach Einbruch der Nacht sehr unwahrscheinlich, also verlieren Sie keine Zeit.",
] execVM "common\fx\translateArray.sqf";
*/


params ["_string_1", "_string_2"];

playSound "intro";
sleep 15;
//["", "<t size='5' align='center'>bloblo</t>"] execVM "custom\intro\shuffletext.sqf"
_string_1 = "<t size='3' shadow='0' font='EtelkaMonospaceProBold' align='center' color='#99999999'>H I D D E N</t><t size='3' shadow='0' font='EtelkaMonospaceProBold' align='center' color='#99999999'> </t><t size='3' shadow='0' font='EtelkaMonospaceProBold' align='center' color='#99000000'>S T A S H E S</t>";
_string_2 = "<t size='3' shadow='0' font='EtelkaMonospaceProBold' align='center' color='#99999999'>S U O M E N</t><t size='3' shadow='0' font='EtelkaMonospaceProBold' align='center' color='#99999999'> </t><t size='3' shadow='0' font='EtelkaMonospaceProBold' align='center' color='#99000000'>S A N K A R I</t>";

private _array_1 = _string_1 splitString " "; // splitString " ";
private _array_2 = _string_2 splitString " ";

// systemChat str _array_1;
// systemChat str _array_2;

private _array_1_length = count _array_1;
private _array_2_length = count _array_2;

private _empty_array = [];

private _ctrl = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
_ctrl ctrlSetPosition [ 
    safeZoneX + safeZoneW/2 - safeZoneW/2, 
    (safezoneY + safeZoneH)/3, 
    safezoneWAbs, 
    safeZoneH/10
];

_ctrl ctrlSetBackgroundColor [0, 0, 0, 0]; 
_ctrl ctrlSetFade 1;
_ctrl ctrlCommit 0;

[_ctrl, 1.2, 30] spawn BIS_fnc_ctrlSetScale;

_ctrl ctrlSetFade 0;
_ctrl ctrlCommit 3;

// fill empty array for incoming message
/*
for [{_i=0}, {_i<_array_1_length}, {_i=_i+1}] do
{
    _empty_array = _empty_array + [""];
};
*/

_ctrl ctrlSetStructuredText parseText _string_1; // parseText (_empty_array joinString " ");
/*
sleep 1;
for [{_i=0}, {_i<_array_1_length}, {_i=_i+1}] do
    {
    //hintsilent format ["%1",_i];
     _display = _empty_array joinString " ";
     _empty_array set [_i, _array_1 select _i];
     _result = _empty_array joinString " ";
     // hintsilent format ["%1",_result];
     _ctrl ctrlSetStructuredText parseText _result;
     
    // _control ctrlSetStructuredText _result;
    sleep (random 0.2 + 0.1);
};
*/
// check for difference between russian and german translation in string length
// _difference = _array_1_length - _array_2_length;

// fill the smaller array with empty strings
/*
switch (true) do {
    case (_difference > 0): {
        for [{_i=0}, {_i<_difference}, {_i=_i+1}] do
        {
        _array_2 = _array_2 + [""];
        };
    };

    case (_difference < 0): {
        for [{_i=_difference}, {_i < 0}, {_i=_i+1}] do
        {
        _array_1 = _array_1 + [""];
        };
    };
    default {};
};
*/

_array_1_length = count _array_1;
_array_2_length = count _array_2;
sleep 7;

private _usedIndexes = [];
{
    _usedIndexes pushBackUnique _forEachIndex;
} forEach _array_1;

private _shuffledArray = _usedIndexes call BIS_fnc_arrayShuffle;

for [{_i=0}, {_i<_array_1_length}, {_i=_i+1}] do
    {
     // _display = _array_1 joinString " ";
     // systemChat str _array_1;

     private _randomIndex = _shuffledArray select 0;
     _shuffledArray deleteAt 0;
     // diag_log format ["_array_1 %1 - index %2", _randomIndex, _randomIndex];
     // diag_log format ["_array_2 %1 - index %2", _randomIndex, _randomIndex];

     private _newCharacter = _array_2 select _randomIndex;

     _array_1 set [_randomIndex, _newCharacter];
     _array_2 joinString " ";
     _result = _array_1 joinString " "; // _array_1 joinString " ";
     /*
     _array_1 set [_i, _array_2 select _i];
     _result = _array_1 joinString " ";
     */
     _ctrl ctrlSetStructuredText parseText _result;
     // systemChat str _i;
     // systemChat _newCharacter;
     // ((_array_1 select _randomIndex) != _newCharacter) && 
     if (_newCharacter != " " && count _newCharacter == 1) then {
         // systemChat (_newCharacter + " plop");
         playSound selectRandom ["ACE_heartbeat_slow_1", "ACE_heartbeat_slow_2"];
         sleep 2;
     };
};

private _ctrlTWO = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
_ctrlTWO ctrlSetPosition [ 
    safeZoneX + safeZoneW/2 - safeZoneW/2, 
    (safezoneY + safeZoneH)/5 + (safezoneY + safeZoneH)/8.5, 
    safezoneWAbs, 
    safeZoneH/10
];

_ctrlTWO ctrlSetStructuredText parseText "<t size='4' shadow='0' font='EtelkaMonospaceProBold' align='center' color='#ffffffff'>2  </t>";
_ctrlTWO ctrlSetBackgroundColor [0, 0, 0, 0]; 
_ctrlTWO ctrlSetFade 1;
_ctrlTWO ctrlCommit 0;

[_ctrlTWO, 1.2, 5] spawn BIS_fnc_ctrlSetScale;

_ctrlTWO ctrlSetFade 0;
_ctrlTWO ctrlCommit 3;

sleep 5;

_ctrl ctrlSetFade 1;
_ctrl ctrlCommit 3;

_ctrlTWO ctrlSetFade 1;
_ctrlTWO ctrlCommit 3;

sleep 3;
0 cutText ["", "PLAIN"];

ctrlDelete _ctrl;
ctrlDelete _ctrlTWO;
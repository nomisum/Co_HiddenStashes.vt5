#include "component.hpp"

params ["_player", "_side", "_respawnComplete"];
private ["_leader", "_groupName"];

if (!isServer) exitWith {};
if (isNull _player) exitWith {};

_allGroupNames = [
    "Alpha",
    "Bravo",
    "Charlie",
    "Delta",
    "Echo",
    "Foxtrot",
    "Golf",
    "Hotel",
    "India",
    "Juliet",
    "Kilo",
    "Lima",
    "Mike",
    "November",
    "Oscar",
    "Papa",
    "Quebec",
    "Romeo",
    "Sierra",
    "Tango",
    "Uniform",
    "Victor",
    "Whiskey",
    "X-Ray",
    "Yankee",
    "Zulu"
];

//check player side
if (_side == "UNKNOWN") exitWith {INFO_1("Player %1's side is unknown.", _player)};
if (_side == "INDEPENDENT" || _side == "WEST") then {
    newBluSpawns pushBack _player;
};

//player is not leader --> join leader
if (_player != _leader) then {
    [_player] joinSilent _leader;
    INFO_2("Player %1 joined %2's group.", _player, _leader);
};

//player is leader --> register group
if (_player == _leader) then {
    _groupExists = true;
    _groupName = "";
    for [{_i=0}, {_i<(count _allGroupNames)}, {_i=_i+1}] do {
        _groupName = _allGroupNames select _i;
        _groupExists = str (["GetGroupByName", [_groupName, side _leader]] call BIS_fnc_dynamicGroups) != "<NULL-group>";
        if (!_groupExists) exitWith {};
    };
    _i = 0;
    while {_groupExists} do {
        _groupName = format ["%1 %2", _groupName, _i];
        _groupExists = str (["GetGroupByName", [_groupName, side _leader]] call BIS_fnc_dynamicGroups) != "<NULL-group>";
        _i = _i + 1;
    };

    ["RegisterGroup", [group _leader, _leader, [nil, _groupName, false]]] call BIS_fnc_dynamicGroups;
    INFO_2("Player %1 is groupleader of new respawned players for side %2.", _player, _side);
};

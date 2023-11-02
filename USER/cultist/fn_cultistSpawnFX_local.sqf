params ["_player", "_placeholder", "_type", "_sound", "_owner", "_isResurrect"];

if (_owner && !_isResurrect && (_type != "sense")) then {
	[_placeholder, getPos _placeholder] call grad_cultist_fnc_cultistBeamCreate; // beam + spawn FX, gets deleted when !manaDrain
};

[_player, _type] call grad_cultist_fnc_cultistSpawnFX_hands; // hand FX, gets deleted when !manaDrain
[_player, _sound] remoteexec ["grad_cultist_fnc_cultistTranceCreate", 2]; // singing sound, gets deleted when !manaDrain

_player setMimic "dead";


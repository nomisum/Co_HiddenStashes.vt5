params ["_zombie"];

_zombie enableDynamicSimulation true;
_zombie setVariable ["RZ_vehicleClass","RyanZombieC_man_1"];
_zombie setVariable ["RZ_isDemon", false];
_zombie setVariable ["suomen_overwriteRZ", false];
// [_zombie] call HS_spawner_fnc_setFace;

_zombie setVariable ["RZ_aggressiveSoundCount",round (random 5),true];

/*
_zombie disableAI "FSM";
_zombie disableAI "MINEDETECTION";
_zombie disableAI "SUPPRESSION";
_zombie disableAI "NVG";
_zombie disableAI "CHECKVISIBLE";
_zombie disableAI "COVER";
_zombie disableAI "RADIOPROTOCOL";
_zombie disableAI "WEAPONAIM";
_zombie disableAI "LIGHTS";
_zombie disableAI "AIMINGERROR";
*/

{
	_x addCuratorEditableObjects [[_zombie], true];
	nil
} count allCurators;
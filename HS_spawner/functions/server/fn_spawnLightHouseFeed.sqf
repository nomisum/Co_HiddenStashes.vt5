params ["_pos"];

if (missionNamespace getVariable ["lightHouseFeed", false]) exitWith {};
missionNamespace setVariable ["lightHouseFeed", true, true];

private _grpUnit = createGroup independent;
_unit = _grpUnit createUnit ["GRAD_CivilianZed_uniform_hiker4", _pos, [], 0, "NONE"];
_grpUnit setVariable ["ace_map_hideBlueForceMarker", true, true];
_unit setVariable ["suomen_overwriteRZ", true];
_unit setVariable ["RZ_isDemon", false];
_unit setVariable ["RZ_vehicleClass","RyanZombieC_man_1"];
_unit setVariable ["RZ_aggressiveSoundCount",round (random 5),true]; 

[_unit, selectRandom ["RyanZombieFace1", "RyanZombieFace2", "RyanZombieFace3", "RyanZombieFace4", "RyanZombieFace5", "RyanZombieFace6"]] remoteExec ["setFace", 0, _unit];

_grpTargetUnit = createGroup west;
_targetUnit = _grpTargetUnit createUnit ["UK3CB_ADC_B_WORK_01_U", _pos, [], 0, "CAN_COLLIDE"];
_targetUnit setHit["legs",1];

_unit reveal _targetUnit;
[_unit, _targetUnit] spawn RZ_fnc_zombie_engageTarget;

_targetUnit setDamage 1;
createVehicle ["BloodSplatter_01_Large_New_F",_targetUnit, [], 0, "NONE"];
createVehicle ["BloodSpray_01_New_F",_targetUnit, [], 0, "NONE"];
createVehicle ["BloodPool_01_Large_New_F",_targetUnit, [], 0, "CAN_COLLIDE"];
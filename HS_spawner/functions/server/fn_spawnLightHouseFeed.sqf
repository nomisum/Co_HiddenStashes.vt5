params ["_pos"];

if (missionNamespace getVariable ["lightHouseFeed", false]) exitWith {};
missionNamespace setVariable ["lightHouseFeed", true, true];

private _grpUnit = createGroup independent;
_zombie = _grpUnit createUnit ["GRAD_CivilianZed_uniform_hiker4", _pos, [], 0, "NONE"];
[_zombie] call HS_spawner_fnc_zombieInit;

_grpTargetUnit = createGroup west;
_targetUnit = _grpTargetUnit createUnit ["UK3CB_ADC_B_WORK_01_U", _pos, [], 0, "CAN_COLLIDE"];
_targetUnit setHit["legs",1];

_zombie reveal _targetUnit;
[_zombie, _targetUnit] spawn HS_spawner_fnc_enemies_feedOnTargetAny;

_targetUnit setDamage 1;
createVehicle ["BloodSplatter_01_Large_New_F",_targetUnit, [], 0, "NONE"];
createVehicle ["BloodSpray_01_New_F",_targetUnit, [], 0, "NONE"];
createVehicle ["BloodPool_01_Large_New_F",_targetUnit, [], 0, "CAN_COLLIDE"];
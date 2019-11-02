params ["_object"];

private _position = position _object;

_position set [2,1.7];

if (!isServer) exitWith {};

if (missionNamespace getVariable ["policeFeed", false]) exitWith {};
missionNamespace setVariable ["policeFeed", true, true];

private _grpUnit = createGroup east;

for "_i" from 0 to 3 do {
    private _unit = _grpUnit createUnit ["GRAD_CivilianZed_rds_uniform_citizen2_walker", position _object, [], 0.5, "NONE"];
    _grpUnit setVariable ["ace_map_hideBlueForceMarker", true, true];
    _unit setVariable ["suomen_overwriteRZ", true];
    _unit setVariable ["RZ_isDemon", false];
    _unit setVariable ["RZ_vehicleClass","RyanZombieC_man_1"];
    _unit setVariable ["RZ_aggressiveSoundCount",round (random 5),true]; 

    [_unit, selectRandom ["Zombi","Zomboy", "Infected1", "Infected2"]] remoteExec ["setFace", 0, _unit];

    _unit reveal _object;
    [_unit, _object] spawn RZ_fnc_zombie_engageTarget;
};

_object setDamage 1;
params ["_object"];

private _position = position _object;

_position set [2,2];

if (!isServer) exitWith {};

if (missionNamespace getVariable ["policeFeed", false]) exitWith {};
missionNamespace setVariable ["policeFeed", true, true];

private _grpUnit = createGroup east;

private _allTypes = [
    "GRAD_CivilianZed_uniform_Woodlander1",
        "GRAD_CivilianZed_uniform_Woodlander2",
        "GRAD_CivilianZed_uniform_Woodlander3",
        "GRAD_CivilianZed_uniform_Woodlander4",
        "GRAD_CivilianZed_uniform_Woodlander4",
        "GRAD_CivilianZed_uniform_Functionary1",
        "GRAD_CivilianZed_uniform_Functionary2",
        "GRAD_CivilianZed_uniform_Worker1",
        "GRAD_CivilianZed_uniform_Worker2",
        "GRAD_CivilianZed_uniform_Worker3",
        "GRAD_CivilianZed_uniform_Worker4",
        "GRAD_CivilianZed_uniform_vip",
        "GRAD_CivilianZed_uniform_priest",
        "GRAD_CivilianZed_uniform_villager1",
        "GRAD_CivilianZed_uniform_villager2",
        "GRAD_CivilianZed_uniform_villager3",
        "GRAD_CivilianZed_uniform_villager4",
        "GRAD_CivilianZed_uniform_profiteer1",
        "GRAD_CivilianZed_uniform_profiteer2",
        "GRAD_CivilianZed_uniform_profiteer3",
        "GRAD_CivilianZed_uniform_profiteer4",
        "GRAD_CivilianZed_uniform_hiker1",
        "GRAD_CivilianZed_uniform_hiker2",
        "GRAD_CivilianZed_uniform_hiker3",
        "GRAD_CivilianZed_uniform_hiker4",
        "GRAD_CivilianZed_uniform_coach1",
        "GRAD_CivilianZed_uniform_coach2",
        "GRAD_CivilianZed_uniform_coach3",
        "GRAD_CivilianZed_uniform_coach4",
        "GRAD_CivilianZed_uniform_activist1",
        "GRAD_CivilianZed_uniform_activist2",
        "GRAD_CivilianZed_uniform_activist3",
        "GRAD_CivilianZed_uniform_activist4",
        "GRAD_CivilianZed_uniform_doc1",
        "GRAD_CivilianZed_uniform_doc2",
        "GRAD_CivilianZed_uniform_doc3"
];

for "_i" from 0 to 3 do {
    private _unit = _grpUnit createUnit [selectRandom _allTypes, _position, [], 0, "NONE"];
    _grpUnit setVariable ["ace_map_hideBlueForceMarker", true, true];
    _unit setVariable ["suomen_overwriteRZ", true];
    _unit setVariable ["RZ_isDemon", false];
    _unit setVariable ["RZ_vehicleClass","RyanZombieC_man_1"];
    _unit setVariable ["RZ_aggressiveSoundCount",round (random 5),true]; 

    [_unit] call hs_spawner_fnc_setFace;

    {
        _x addCuratorEditableObjects [[_unit],true];
        nil
    } count allCurators;

    _unit reveal _object;
    [_unit, "AinvPercMstpSnonWnonDnon"] remoteExecCall ["fnc_RyanZombies_PlayMoveNow"]; 
    _unit disableAI "ANIM";

    _unit addEventHandler ["HandleDamage", {
	    params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit"];

        if (!isNil _projectile && !(_unit getvariable ["grad_gotHit", false])) then {
            _unit setvariable ["grad_gotHit", true];
            _unit setVariable ["RZ_eatingSeconds", 9999];
        };

    }];
};

_object setDamage 1;
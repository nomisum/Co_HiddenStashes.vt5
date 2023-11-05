params ["_position", ["_type", "random"], ["_radius", 0]];



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

private _uniform = selectRandom _allTypes;
private _classname = _uniform; // default

switch (_type) do { 
    case "random" : {
        private _format = format ["%1", selectRandom ["_slow", "_walker", "_crawler", "", "_spider"]];
        _classname = (_uniform + _format);
    };
    case "slow" : {
        private _format = format ["%1", "_slow"];
        _classname = (_uniform + _format);
    };
    case "walker" : {
        private _format = format ["%1", "_walker"];
        _classname = (_uniform + _format);
    };
    case "crawler" : {
        private _format = format ["%1", "_crawler"];
        _classname = (_uniform + _format);
    };
    case "fast" : {
        private _format = format ["%1", ""]; // fast has no ending?
        _classname = (_uniform + _format);
    };
    case "spider" : {
        private _format = format ["%1", "_spider"];
        _classname = (_uniform + _format);
    };
    default {};
};

// hint (_classname + "   " + str _position);

// systemChat (_classname + " " + str _position + " " + str _type + " " + str _radius);

private _zombie = grad_globalzombiegroup createUnit [_classname, _position, [], _radius, "NONE"];
[_zombie] call HS_spawner_fnc_zombieInit;


_zombie setposATL [(getposATL _zombie select 0), (getposATL _zombie select 1), 0];
[_zombie, "AmovPercMstpSnonWnonDnon_SaluteOut"] remoteExec ["switchmove", 0];
// _zombie setVariable ["suomen_smells", true];

_zombie

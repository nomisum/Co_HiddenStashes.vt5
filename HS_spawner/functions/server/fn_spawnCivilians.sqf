params ["_position", ["_type", "random"]];

private _allTypes = [
    "GRAD_CivilianZed_rds_schoolteacher",
    "GRAD_CivilianZed_rds_Functionary1",
    "GRAD_CivilianZed_rds_Functionary2",
    "GRAD_CivilianZed_rds_doctor",
    "GRAD_CivilianZed_rds_uniform_priest",
    "GRAD_CivilianZed_rds_uniform_assistant",
    "GRAD_CivilianZed_rds_uniform_Worker1",
    "GRAD_CivilianZed_rds_uniform_Worker2",
    "GRAD_CivilianZed_rds_uniform_Worker3",
    "GRAD_CivilianZed_rds_uniform_Worker4",
    "GRAD_CivilianZed_rds_uniform_Woodlander1",
    "GRAD_CivilianZed_rds_uniform_Woodlander2",
    "GRAD_CivilianZed_rds_uniform_Woodlander3",
    "GRAD_CivilianZed_rds_uniform_Woodlander4",
    "GRAD_CivilianZed_rds_uniform_Villager1",
    "GRAD_CivilianZed_rds_uniform_Villager2",
    "GRAD_CivilianZed_rds_uniform_Villager3",
    "GRAD_CivilianZed_rds_uniform_Villager4",
    "GRAD_CivilianZed_rds_uniform_Profiteer1",
    "GRAD_CivilianZed_rds_uniform_Profiteer2",
    "GRAD_CivilianZed_rds_uniform_Profiteer3",
    "GRAD_CivilianZed_rds_uniform_Profiteer4",
    "GRAD_CivilianZed_rds_uniform_citizen1",
    "GRAD_CivilianZed_rds_uniform_citizen2",
    "GRAD_CivilianZed_rds_uniform_citizen3",
    "GRAD_CivilianZed_rds_uniform_citizen4",
    "GRAD_CivilianZed_rds_uniform_Rocker1",
    "GRAD_CivilianZed_rds_uniform_Rocker2",
    "GRAD_CivilianZed_rds_uniform_Rocker3",
    "GRAD_CivilianZed_rds_uniform_Rocker4"
];

private _uniform = selectRandom _allTypes;
private _classname = "";

switch (_type) do { 
    case "random" : {
        private _format = format ["%1", selectRandom ["_slow", "_walker", "_crawler", "_fast"]];
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
        private _format = format ["%1", "_fast"];
        _classname = (_uniform + _format);
    };
    default {};
};

hint (_classname + "   " + str _position);


private _grp = creategroup east;
private _zombie = _grp createUnit [_classname, _position, [], 0, "NONE"];

_zombie enableDynamicSimulation true;
_zombie setVariable ["RZ_vehicleClass","RyanZombieC_man_1"];
_zombie setVariable ["RZ_isDemon", false];
_zombie setVariable ["suomen_overwriteRZ", true];

_zombie setposATL [(getposATL _zombie select 0), (getposATL _zombie select 1), 0];
_zombie setVariable ["suomen_smells", true];

[_zombie, "AmovPercMstpSnonWnonDnon_SaluteOut"] remoteExec ["switchMove", 0];

_zombie
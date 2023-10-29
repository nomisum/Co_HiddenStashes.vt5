params ["_model"];

private _return = "";

switch (_model) do {
	case "rhs_emr_base_gloves.p3d": { _return = "GRAD_SoldierZed_rhs_vdv_rifleman"; };
	case "UK3CB_Woodlander.p3d": { _return = "GRAD_CivilianZed_uniform_Woodlander1"; };
	case "UK3CB_Functionary.p3d": { _return = "GRAD_CivilianZed_uniform_Functionary1"; };
	default {};
};

_return
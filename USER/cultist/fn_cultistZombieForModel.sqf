params ["_body"];

(getModelInfo _body) params ["_model"];
(getObjectTextures _body) params ["_textures"];

private _texture = "";
// biki says array is expected, actually can be string apparently
if (_textures isEqualType []) then {
	if ((count _textures) > 0) then { _texture = toLower (_textures#0); };
};
if (_textures isEqualType "") then {
	_texture = toLower _textures;
};

// if texture is missing, look up for uniform in config
if (_texture == "") then {
	private _hiddenselectiontexture = getArray (configFile >> "cfgWeapons" >> (uniform _body) >> "hiddenSelectionsTextures");
	if ((count _hiddenselectiontexture) > 0) then {
		_texture = _hiddenselectiontexture#0;
	};
};

private _classname = "GRAD_SoldierZed_rhs_vdv_rifleman";

switch (_model) do {
	case "rhs_emr_base_gloves.p3d": { _classname = "GRAD_SoldierZed_rhs_vdv_rifleman"; };
	case toLower "CBRN_Suit_01_F.p3d": { if (_texture == toLower "\a3\Characters_F_Enoch\Uniforms\Data\CBRN_Suit_01_CO.paa") then { _classname = "GRAD_SoldierZed_Oversuit_Blue"; } else { _classname = "GRAD_SoldierZed_Oversuit_White"; }; };
	case toLower "UK3CB_Woodlander.p3d": { 
		switch (_texture) do {
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\woodlander_co.paa": { _classname = "GRAD_CivilianZed_uniform_Woodlander1"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\woodlander_v2_co.paa": { _classname = "GRAD_CivilianZed_uniform_Woodlander2"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\woodlander_v3_co.paa": { _classname = "GRAD_CivilianZed_uniform_Woodlander3"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\woodlander_v4_co.paa": { _classname = "GRAD_CivilianZed_uniform_Woodlander4"; };
			default { _classname = "UK3CB_CHC_C_U_PRIEST_01";  };
		};
	};
	case toLower "UK3CB_Functionary.p3d": { 
		switch (_texture) do {
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\functionary_co.paa": { _classname = "GRAD_CivilianZed_uniform_Functionary1"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\functionary2_co.paa": { _classname = "GRAD_CivilianZed_uniform_Functionary2"; };
			default { _classname = "UK3CB_CHC_C_U_PRIEST_01";  };
		};	
	};

	case toLower "uk3cb_coach.p3d": { 
		switch (_texture) do {
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\functionary_co.paa": { _classname = "GRAD_CivilianZed_uniform_Functionary1"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\functionary2_co.paa": { _classname = "GRAD_CivilianZed_uniform_Functionary2"; };
			default { _classname = "UK3CB_CHC_C_U_PRIEST_01";  };
		};	
	};

	case toLower "UK3CB_Overall.p3d": { 
		switch (_texture) do {
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\overall_1_co.paa": { _classname = "GRAD_CivilianZed_uniform_Worker1"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\overall_2_co.paa": { _classname = "GRAD_CivilianZed_uniform_Worker2"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\overall_3_co.paa": { _classname = "GRAD_CivilianZed_uniform_Worker3"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\overall_4_co.paa": { _classname = "GRAD_CivilianZed_uniform_Worker4"; };
			default { _classname = "UK3CB_CHC_C_U_PRIEST_01";  };
		};	
	};
	case toLower "c_nikos_aged.p3d.p3d": { _classname = "GRAD_CivilianZed_uniform_vip"; };
	case toLower "UK3CB_PRIEST.p3d": { _classname = "GRAD_CivilianZed_uniform_priest"; };
	case toLower "UK3CB_Villager.p3d": { 
		switch (_texture) do {
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\villager_co.paa": { _classname = "GRAD_CivilianZed_uniform_villager1"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\villager_v2_co.paa": { _classname = "GRAD_CivilianZed_uniform_villager2"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\villager_v3_co.paa": { _classname = "GRAD_CivilianZed_uniform_villager3"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\villager_v4_co.paa": { _classname = "GRAD_CivilianZed_uniform_villager4"; };
			default { _classname = "UK3CB_CHC_C_U_PRIEST_01";  };
		};
	};
	case toLower "UK3CB_Profiteer.p3d": { 
		switch (_texture) do {
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\profiteer_co.paa": { _classname = "GRAD_CivilianZed_uniform_profiteer1"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\profiteer_v2_co.paa": { _classname = "GRAD_CivilianZed_uniform_profiteer2"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\profiteer_v3_co.paa": { _classname = "GRAD_CivilianZed_uniform_profiteer3"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\profiteer_v4_co.paa": { _classname = "GRAD_CivilianZed_uniform_profiteer4"; };
			default { _classname = "UK3CB_CHC_C_U_PRIEST_01";  };
		};
	};
	case toLower "UK3CB_activist.p3d": { 
		switch (_texture) do {
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\ins_bardak_co.paa": { _classname = "GRAD_CivilianZed_uniform_activist1"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\ins_bardak_2_co.paa": { _classname = "GRAD_CivilianZed_uniform_activist2"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\ins_bardak_3_co.paa": { _classname = "GRAD_CivilianZed_uniform_activist3"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\ins_bardak_4_co.paa": { _classname = "GRAD_CivilianZed_uniform_activist4"; };
			default { _classname = "UK3CB_CHC_C_U_PRIEST_01";  };
		};
	};
	case toLower "UK3CB_Doctor.p3d": {
		switch (_texture) do {
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\doctor_co.paa": { _classname = "GRAD_CivilianZed_uniform_doc1"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\doctor2_co.paa": { _classname = "GRAD_CivilianZed_uniform_doc2"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\doctor_3_co.paa": { _classname = "GRAD_CivilianZed_uniform_doc3"; };
			default { _classname = "UK3CB_CHC_C_U_PRIEST_01";  };
		};	
	};
	case toLower "UK3CB_Hiker.p3d": {
		switch (_texture) do {
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_CHC\data\chc_c_hiker_red_co.paa": { _classname = "GRAD_CivilianZed_uniform_hiker1"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_CHC\data\chc_c_hiker_pants_blu_co.paa": { _classname = "GRAD_CivilianZed_uniform_hiker1"; };			
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_CHC\data\chc_c_hiker_grn_co.paa": { _classname = "GRAD_CivilianZed_uniform_hiker2"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_CHC\data\chc_c_hiker_pants_red_co.paa": { _classname = "GRAD_CivilianZed_uniform_hiker2"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_CHC\data\chc_c_hiker_blue_co.paa": { _classname = "GRAD_CivilianZed_uniform_hiker3"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_CHC\data\chc_c_hiker_pants_grn_co.paa": { _classname = "GRAD_CivilianZed_uniform_hiker3"; };

			default { _classname = "UK3CB_CHC_C_U_PRIEST_01";  };
		};	
	};
	case toLower "UK3CB_Coach.p3d": {
		switch (_texture) do {
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\ins_lopotev_co.paa": { _classname = "GRAD_CivilianZed_uniform_coach1"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\ins_lopotev_2_co.paa": { _classname = "GRAD_CivilianZed_uniform_coach2"; };			
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\ins_lopotev_3_co.paa": { _classname = "GRAD_CivilianZed_uniform_coach3"; };
			case toLower "UK3CB_Factions\addons\UK3CB_Factions_Equipment\uniforms\data\ins_lopotev_4_co.paa": { _classname = "GRAD_CivilianZed_uniform_coach4"; };

			default { _classname = "UK3CB_CHC_C_U_PRIEST_01";  };
		};	
	};
	default {};
};

if (random 2 > 1.5) then {
	_classname = _classname + "_slow";
	if (random 2 > 1.5) then {
		_classname = _classname + "_walker";
	};
};



diag_log format ["resurrecting %1 with model %2 and texture %3", _classname, _model, _texture];



_classname
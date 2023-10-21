player setUnitLoadout [
	[["arifle_MXC_Black_Holo_FL_F","","acc_flashlight","optic_Holosight_blk_F",
		["30Rnd_65x39_caseless_black_mag",30],[],""],[],["hgun_P07_khk_F","","","",["16Rnd_9x21_Mag",17],[],""],
		["UK3CB_CHC_C_U_PRIEST_02",
		[
			["FirstAidKit",1],["30Rnd_65x39_caseless_black_mag",1,30]
		]
	],["rhs_vest_pistol_holster",
		[
			["30Rnd_65x39_caseless_black_mag",2,30]
		]
	],["B_SCBA_01_F",[]
	],"","G_Bandanna_RedFlame1",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]],[]
];

player setPos (getMarkerPos "mrk_shaman_hq");
player setVariable ["ace_map_hideBlueForceMarker",false,true];
player setUnitLoadout [["","","acc_flashlight","optic_Holosight_blk_F",
		["30Rnd_65x39_caseless_black_mag",30],[],""],[],["","","","",[""],[],""],
		["UK3CB_CHC_C_U_PRIEST_02",
		[
			["FirstAidKit",1],["30Rnd_65x39_caseless_black_mag",1,30]
		]
	],["rhs_vest_pistol_holster",
		[
			["30Rnd_65x39_caseless_black_mag",2,30]
		]
	],["B_SCBA_01_F",[]
	],"","G_Bandanna_RedFlame1",[],["ItemMap","","","ItemCompass","ItemWatch",""]
];

[] call HS_spawner_fnc_createTaskCultist;
[] call HS_spawner_fnc_assignTaskCultist;

player setPos (getMarkerPos "mrk_cultist_hq");
player setVariable ["ace_map_hideBlueForceMarker",true,true];

["ACRE_PRC152", "default3"] call acre_api_fnc_setPreset;

player addItem "ACRE_PRC152";

["cu"] call acre_api_fnc_babelSetSpokenLanguages;
["cu"] call acre_api_fnc_babelSetSpeakingLanguage;

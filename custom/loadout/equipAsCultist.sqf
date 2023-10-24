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
	],"","G_Bandanna_RedFlame1",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]
];

[] call HS_spawner_fnc_createTaskCultist;
[] call HS_spawner_fnc_assignTaskCultist;

player setPos (getMarkerPos "mrk_cultist_hq");
player setVariable ["ace_map_hideBlueForceMarker",false,true];

player addItem "ACRE_PRC152";

// wait till player has radio assigned, set channels and languages
[{
    [player] call acre_api_fnc_hasRadio
},{
    private _radio = [“ACRE_PRC152”] call acre_api_fnc_getRadioByType;
	[_radio, 10] call acre_api_fnc_setRadioChannel;
	["cu"] call acre_api_fnc_babelSetSpokenLanguages;
	["cu"] call acre_api_fnc_babelSetSpeakingLanguage;

}] call CBA_fnc_waitUntilAndExecute;
player setUnitLoadout [
    ["UK3CB_MP5A2","uk3cb_acc_surefiregrip","acc_flashlight","rhsusf_acc_eotech_552",["UK3CB_MP5_30Rnd_9x19_Magazine_YT",30],[],""],[],
    ["hgun_P07_khk_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_I_E_CBRN_Suit_01_EAF_F",[["FirstAidKit",1]]],
    ["V_CarrierRigKBT_01_heavy_Olive_F",[["ACE_fieldDressing",8],["ACE_epinephrine",3],["ACE_morphine",4],["ACE_Flashlight_KSF1",1],["ACE_M84",2,1],["SmokeShell",1,1],["SmokeShellGreen",1,1],["Chemlight_green",2,1],["UK3CB_MP5_30Rnd_9x19_Magazine_YT",6,30]]],["B_CombinationUnitRespirator_01_F",[["UK3CB_MP5_30Rnd_9x19_Magazine_YT",1,30]]],
    "H_HelmetB_plain_wdl","G_AirPurifyingRespirator_01_F",[],
    ["ItemMap","ItemGPS","","ItemCompass","ChemicalDetector_01_watch_F",""]
];

[] call HS_spawner_fnc_createTaskLDF;
[] call HS_spawner_fnc_assignTaskLDF;

player setPos (getMarkerPos "mrk_blufor_hq");
player setVariable ["ace_map_hideBlueForceMarker",false,true];

["ACRE_PRC152", "default2"] call acre_api_fnc_setPreset;

player addItem "ACRE_PRC152";

["en"] call acre_api_fnc_babelSetSpokenLanguages;
["en"] call acre_api_fnc_babelSetSpeakingLanguage;

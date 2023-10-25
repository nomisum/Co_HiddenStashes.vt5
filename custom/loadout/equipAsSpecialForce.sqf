player setUnitLoadout [
    ["rhs_weap_vhsd2","hlc_muzzle_556NATO_KAC","acc_flashlight","rhsusf_acc_eotech_552",["rhsgref_30rnd_556x45_vhs2",30],[],""],[],
    ["hgun_P07_khk_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_I_E_CBRN_Suit_01_EAF_F",[["FirstAidKit",1]]],
    ["V_CarrierRigKBT_01_heavy_Olive_F",[["ACE_fieldDressing",8],["ACE_epinephrine",3],["ACE_morphine",4],["ACE_Flashlight_KSF1",1],["HandGrenade",2,1],["SmokeShell",1,1],["SmokeShellGreen",1,1],["Chemlight_green",2,1],["rhsgref_30rnd_556x45_vhs2",6,30]]],["B_CombinationUnitRespirator_01_F",[["rhsgref_30rnd_556x45_vhs2",1,30]]],
    "H_HelmetB_plain_wdl","G_AirPurifyingRespirator_01_F",[],
    ["ItemMap","ItemGPS","","ItemCompass","ChemicalDetector_01_watch_F",""]
];

[] call HS_spawner_fnc_createTaskLDF;
[] call HS_spawner_fnc_assignTaskLDF;

player setPos (getMarkerPos "mrk_blufor_hq");
player setVariable ["ace_map_hideBlueForceMarker",false,true];

player addItem "ACRE_PRC152";

// wait till player has radio assigned, set channels and languages
[{
    [player] call acre_api_fnc_hasRadio
},{
    private _radio = ["ACRE_PRC152", player] call acre_api_fnc_getRadioByType;
    [_radio, 7] call acre_api_fnc_setRadioChannel;
    ["en"] call acre_api_fnc_babelSetSpokenLanguages;
    ["en"] call acre_api_fnc_babelSetSpeakingLanguage;

}] call CBA_fnc_waitUntilAndExecute;
class agent {
	class AllUnits {
        primaryWeapon = "";
		primaryWeaponMagazine = "";
		primaryWeaponMuzzle = "";
		primaryWeaponOptics = "";
		primaryWeaponPointer = "";
		primaryWeaponUnderbarrel = "";
		secondaryWeapon = "";
		handgunWeapon = "rhsusf_weap_m9";
		handgunWeaponMagazine = "rhsusf_mag_15Rnd_9x19_JHP";
		uniform = "";
        vest = "";
		backpack = "";
		headgear = "";
		nvgoggles = "";
		radio = "";
		binoculars = "";
		map = "ItemMap";
		gps = "";
        watch = "ChemicalDetector_01_watch_F";
		compass = "ItemCompass";
        addItemsToUniform[] = {};
        addItemsToVest[] = {};
        addItemsToBackpack[] = {};
	};

	class Type {
        //rifleman == scorpion
		class Soldier_F {
            primaryWeapon = "rhs_weap_scorpion";
            primaryWeaponMagazine = "rhsgref_20rnd_765x17_vz61";
            vest = "rhs_vest_pistol_holster";
            addItemsToVest[] = { 
                LIST_2("rhsgref_20rnd_765x17_vz61") 
            };            
            uniform[] = {"UK3CB_CHC_C_U_HIKER_03","UK3CB_CHC_C_U_HIKER_04","UK3CB_CHC_C_U_HIKER_02","UK3CB_CHC_C_U_HIKER_01","UK3CB_CHC_C_U_CIT_01","UK3CB_CHC_C_U_CIT_04","UK3CB_CHC_C_U_CIT_02","UK3CB_CHC_C_U_CIT_03","UK3CB_CHC_C_U_ACTIVIST_03","UK3CB_CHC_C_U_ACTIVIST_01","UK3CB_CHC_C_U_ACTIVIST_04","UK3CB_CHC_C_U_ACTIVIST_02","UK3CB_CHC_C_U_CAN_01","UK3CB_CHC_C_U_COACH_04","UK3CB_CHC_C_U_COACH_01","UK3CB_CHC_C_U_COACH_03","UK3CB_CHC_C_U_COACH_02","UK3CB_CHC_C_U_WORK_03","UK3CB_CHC_C_U_WORK_04","UK3CB_NAP_B_U_WORK_01","UK3CB_CHC_C_U_WORK_02","UK3CB_CHC_C_U_WORK_01","UK3CB_CHC_C_U_PROF_04","UK3CB_CHC_C_U_PROF_03","UK3CB_CHC_C_U_PROF_01","UK3CB_CHC_C_U_PROF_02","UK3CB_CHC_C_U_DOC_03","UK3CB_CHC_C_U_DOC_02","UK3CB_CHC_C_U_DOC_01","UK3CB_CHC_C_U_FUNC_01","UK3CB_CHC_C_U_FUNC_02","UK3CB_CHC_C_U_VILL_01","UK3CB_CHC_C_U_VILL_03","UK3CB_CHC_C_U_VILL_04","UK3CB_CHC_C_U_VILL_02","UK3CB_CHC_C_U_WOOD_04","UK3CB_CHC_C_U_WOOD_02","UK3CB_CHC_C_U_WOOD_01","UK3CB_CHC_C_U_WOOD_03"};
            headgear[] = {"H_Bandanna_cbr","H_Bandanna_sgg","H_Watchcap_blk","H_Booniehat_khk","H_Cap_oli","H_Cap_tan","H_MilCap_gry","H_Shemag_olive","H_Beret_EAF_01_F","H_Booniehat_mgrn","rhsgref_hat_m43cap_heer1_tilted","rhsgref_hat_M1951","H_HeadBandage_stained_F","H_HeadBandage_bloody_F","H_HeadBandage_stained_F","UK3CB_H_Cap_Back_ION_BLK","UK3CB_H_Cap_Back_ION_DES","H_HeadBandage_stained_F", "H_HeadBandage_bloody_F", "H_Hat_Safari_sand_F","H_Hat_grey"};
            goggles = "G_RegulatorMask_F";
            addItemsToUniform[] = {
                LIST_5("ACE_morphine"),
                LIST_10("ACE_fieldDressing"),
                LIST_1("rhsusf_mag_15Rnd_9x19_JHP"),
                LIST_1("ACE_HandFlare_White"),
                LIST_1("rhs_mag_nspd")
            };
		};

        // translator == Handgun only
        class crew_F: Soldier_F {
            primaryWeapon = "";
            primaryWeaponMagazine = "";
            addItemsToVest[] = {};
        };

        //autorifleman == mp7
		class Soldier_AR_F: Soldier_F {
            primaryWeapon = "rhsusf_weap_MP7A2";
            primaryWeaponMagazine = "rhsusf_mag_40Rnd_46x30_FMJ";
            addItemsToVest[] = {
                LIST_3("rhsusf_mag_40Rnd_46x30_FMJ")
            };
		};

        //light AT
		class Soldier_LAT_F: Soldier_F {

		};

        //ammo bearer == pumpgun
		class Soldier_A_F: Soldier_F {
            primaryWeapon = "rhs_weap_M590_5RD";
            primaryWeaponMagazine = "rhsusf_5Rnd_00Buck";
            addItemsToVest[] = {
                LIST_3("rhsusf_5Rnd_00Buck")
            };
		};

        // medic == handgun only
		class Medic_F: Soldier_F {          
            primaryWeapon = "";
            primaryWeaponMagazine = "";
            backpack = "UK3CB_LFR_B_B_MESSENGER_MED";
            addItemsToVest[] = {};
            addItemsToBackpack[] = { 
                LIST_20("ACE_fieldDressing"),
                LIST_10("ACE_morphine"),
                LIST_10("ACE_epinephrine"),
                LIST_2("ACE_bloodIV_250")
            };
        };

        //Squad Leader
        class Soldier_SL_F: Soldier_F {
            radio = "";
            primaryWeapon = "sgun_HunterShotgun_01_sawedoff_F";
            primaryWeaponMagazine = "2Rnd_12Gauge_Pellets";
            addItemsToUniform[] = {
                LIST_5("ACE_morphine"),
                LIST_10("ACE_fieldDressing"),
                LIST_1("rhsusf_mag_15Rnd_9x19_JHP"),
                LIST_1("ACE_HandFlare_White"),
                LIST_1("ACRE_PRC343")
            };
            addItemsToVest[] = {
                LIST_3("2Rnd_12Gauge_Pellets")
            };
        };

        //team leader == mosin
		class Soldier_TL_F: Soldier_SL_F {
            primaryWeapon = "rhs_weap_m38";
            primaryWeaponMagazine = "rhsgref_5Rnd_762x54_m38";
            addItemsToVest[] = {
                LIST_3("rhsgref_5Rnd_762x54_m38")
            };
                
		};
	};

	class Rank {
		class LIEUTENANT {

		};
	};
};

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
            vest = "rds_pistol_holster";
            addItemsToVest[] = {LIST_2("rhsgref_20rnd_765x17_vz61");};            
            uniform[] = {"rds_uniform_citizen1", "rds_uniform_citizen4", "rds_uniform_Functionary2", "rds_uniform_Profiteer3", "rds_uniform_Rocker2", "rds_uniform_schoolteacher", "rds_uniform_Villager3", "rds_uniform_Woodlander4", "U_C_ConstructionCoverall_Blue_F", "U_C_Mechanic_01_F", "U_I_C_Soldier_Bandit_3_F", "U_I_C_Soldier_Bandit_5_F", "U_C_Uniform_Scientist_01_F", "U_I_L_Uniform_01_tshirt_skull_F", "U_C_E_LooterJacket_01_F", "U_I_L_Uniform_01_tshirt_black_F", "U_I_L_Uniform_01_tshirt_olive_F"};
            headgear[] = {"H_Bandanna_cbr","H_Bandanna_sgg","H_Watchcap_blk","H_Booniehat_khk","H_Cap_oli","H_Cap_tan","H_MilCap_gry","H_Shemag_olive","H_Beret_EAF_01_F","H_Booniehat_mgrn","rhsgref_hat_m43cap_heer1_tilted","rhsgref_hat_M1951","rds_rocker_hair1","rds_rocker_hair2","rds_rocker_hair3","rds_Woodlander_cap3","rds_worker_cap2","H_HeadBandage_stained_F", "H_HeadBandage_bloody_F", "H_Hat_Safari_sand_F","H_Hat_grey"};
            goggles = "G_RegulatorMask_F";
            addItemsToUniform[] = {
                LIST_5("ACE_morphine"),
                LIST_10("ACE_fieldDressing"),
                LIST_1("rhsusf_mag_15Rnd_9x19_JHP"),
                LIST_1("ACE_HandFlare_White"),
                LIST_1("rhs_mag_nspd")
            };
		};

        //autorifleman == mp7
        class survivor_F: Soldier_F {
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
            backpack = "ga_dlc_low_messenger_coyote_medic";
            addItemsToVest[] = {};
            addItemsToBackpack[] = { 
                LIST_30("ACE_fieldDressing"),
                LIST_10("ACE_morphine"),
                LIST_10("ACE_epinephrine"),
                LIST_4("ACE_bloodIV_250")
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

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
        //rifleman
		class Soldier_F {
            uniform[] = {"rds_uniform_citizen1", "rds_uniform_citizen4", "rds_uniform_Functionary2", "rds_uniform_Profiteer3", "rds_uniform_Rocker2", "rds_uniform_schoolteacher", "rds_uniform_Villager3", "rds_uniform_Woodlander4", "U_C_ConstructionCoverall_Blue_F", "U_C_Mechanic_01_F", "U_I_C_Soldier_Bandit_3_F", "U_I_C_Soldier_Bandit_5_F", "U_C_Uniform_Scientist_01_F", "U_I_L_Uniform_01_tshirt_skull_F", "U_C_E_LooterJacket_01_F", "U_I_L_Uniform_01_tshirt_black_F", "U_I_L_Uniform_01_tshirt_olive_F"};
            vest = "";
            headgear[] = {"H_Bandanna_cbr","H_Bandanna_sgg","H_Watchcap_blk","H_Booniehat_khk","H_Cap_oli","H_Cap_tan","H_MilCap_gry","H_Shemag_olive","H_Beret_EAF_01_F","H_Booniehat_mgrn","rhsgref_hat_m43cap_heer1_tilted","rhsgref_hat_M1951","rds_rocker_hair1","rds_rocker_hair2","rds_rocker_hair3","rds_Woodlander_cap3","rds_worker_cap2","H_HeadBandage_stained_F", "H_HeadBandage_bloody_F", "H_Hat_Safari_sand_F","H_Hat_grey"};
            goggles = "G_RegulatorMask_F";
            addItemsToUniform[] = {
                LIST_5("ACE_morphine"),
                LIST_10("ACE_fieldDressing"),
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),
                LIST_1("ACE_HandFlare_White"),
                LIST_1("rhs_mag_nspd")
            };
		};

        //autorifleman
		class Soldier_AR_F: Soldier_F {

		};

        //light AT
		class Soldier_LAT_F: Soldier_F {

		};

        //ammo bearer
		class Soldier_A_F: Soldier_F {

		};

        //
		class Medic_F: Soldier_F {
            uniform = "U_BG_Guerrilla_6_1";
            vest = "V_TacVest_oli";
            headgear = "rhsusf_opscore_fg";

            addItemsToVest[] = {
                LIST_4("rhs_30Rnd_545x39_AK"),
                LIST_2("rhsusf_mag_15Rnd_9x19_JHP"),
                LIST_1("ACE_HandFlare_White"),
                LIST_1("rhs_mag_nspd")
            };
		};

        //Squad Leader
        class Soldier_SL_F: Soldier_F {
            radio = "ACRE_PRC343";
        };

        //team leader
		class Soldier_TL_F: Soldier_SL_F {
		};
	};

	class Rank {
		class LIEUTENANT {

		};
	};
};

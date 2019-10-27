class Vehicles {
    displayName = "Vehicles";
    kindOf = "Vehicles";
    spawnEmpty = 1;

    class I_E_Offroad_01_comms_F {
        displayName = "Offroad";
        description = "Seats: 6";
        price = 1000;
        stock = 20;
        permissionLevel = 0;
    };

    class I_E_Heli_light_03_unarmed_F {
        displayName = "Wildcat";
        description = "Seats: 8<br/><br/>";
        price = 2000;
        stock = 3;
        permissionLevel = 1;
        code = "if (isServer) then {(_this select 2) disableTIEquipment true};";
    };

    class I_E_APC_tracked_03_cannon_F {
        displayName = "APC FV720";
        description = "Seats: 10<br/><br/>";
        price = 3000;
        stock = 1;
        permissionLevel = 2;
        code = "if (isServer) then {(_this select 2) disableTIEquipment true};";
    };    
};
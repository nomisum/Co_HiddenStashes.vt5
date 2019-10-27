// if (playerSide == INDEPENDENT) exitWith {[] call wita_common_fnc_startSpectator};


[] call wita_waverespawn_fnc_onPlayerKilled;

if (!(player getVariable ["HS_killedOnce", false])) then {

    player setVariable ["HS_killedOnce", true, true];
    [player] joinSilent (createGroup west);
    player setVariable ["ace_map_hideBlueForceMarker", false, true];


} else {
    // save stuff for clone
    private _goggles = goggles player;
    private _headgear = headgear player;
    private _vest = vest player;
    private _backpack = backpack player;
    private _items = items player;
    private _mags = magazinesAmmoFull player;
    private _primaryWeapon = primaryWeapon player;
    private _secondaryWeapon = secondaryWeapon player;
    private _position = position player;

    [player, _position,  _goggles, _headgear, _vest, _backpack, _items, _mags] remoteExec ["HS_spawner_fnc_spawnClone", 2];

    if (_primaryWeapon != "") then {
        private _holder = "GroundWeaponHolder" createVehicle _position;
        _holder addWeaponCargo [_primaryWeapon, 1];
    };    

    if (_secondaryWeapon != "") then {
        private _holder = "GroundWeaponHolder" createVehicle _position;
        _holder addWeaponCargo [_secondaryWeapon, 1];
    };

    // dont want to duplicate weapons do we
    player removePrimaryWeaponItem _primaryWeapon;
    player removeSecondaryWeaponItem _secondaryWeapon;
};
/*[player, true] call TFAR_fnc_forceSpectator;*/
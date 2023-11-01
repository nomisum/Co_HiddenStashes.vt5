// decide if player should continue on cultist or spec ops side
if (!(player getVariable ["HS_killedOnce", false])) then {
    player setVariable ["HS_killedOnce", true, true];
    player setVariable ["ace_map_hideBlueForceMarker", false, true];
    
    private _isCultist = random 2 > 1.5; // ratio cultist to police should be kinda low
    player setVariable ["GRAD_isCultist", _isCultist, true];
    [player] joinSilent (createGroup west);

    if (_isCultist) then {
        ["cu"] call acre_api_fnc_babelSetSpokenLanguages;   
    } else {
        ["en"] call acre_api_fnc_babelSetSpokenLanguages;
    };

    // add eh before respawn already so it catches the loadout event reliably
    private _id = ["grad_loadout_loadoutApplied",
    {
        params ["_unit","_loadout"];
        if (_unit != player) exitWith {};
        
        DIAG_LOG format ["loadout applied %1", _loadout];

        // override any potential faction stuff after its set
        [{
            if (!(player getVariable ["GRAD_isCultist", false])) then {
                [] execVM "custom\loadout\equipAsSpecialForce.sqf";
            } else {
                [] execVM "custom\loadout\equipAsCultist.sqf";
            };
        }] call CBA_fnc_execNextFrame;
        
    }] call CBA_fnc_addEventhandler;
    diag_log format ["loadout applied eh added %1", _id];


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

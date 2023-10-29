[{
    params ["_args", "_handle"];

    private _baseValue = 0.0003; // 1min for 1
    private _placeholder = player getVariable ["cultist_placeholder", objNull];
    
    // at least player himself
    private _playersInvolved = if (!isNull _placeholder) then { count (_placeholder getVariable ["cultist_ritualInvolved", 1]) } else { 1 };
    
    private _manaRegenerationRate = player getVariable ["cultist_manaRegenerationRate", 0.005]; // 0.01 == 60s to fill up
    private _manaDrainRate = player getVariable ["cultist_manaDrainRate", (_baseValue * 10) / _playersInvolved]; // 10s to drain completely
    private _manaValue = player getVariable ["cultist_manaValue", 1];
    private _isDraining = player getVariable ["cultist_manaDrain", false];

    if (_manaValue < (1 - _manaRegenerationRate) && !_isDraining) then {
        _manaValue = _manaValue + _manaRegenerationRate;
    };

    if (_manaValue > (0) && _isDraining) then {
        _manaValue = _manaValue - _manaDrainRate;
    };

    // abort anything if below threshold
    if (_manaValue < (0.1)) then {
        player setVariable ["cultist_manaDrain", false, true];
    };

    player setVariable ["cultist_manaValue", _manaValue];

}, 0.2, []] call CBA_fnc_addPerFrameHandler;

if (!isServer) exitWith {};

["grad_cultistSpawnMulti", {
    params ["_player1", "_type"];

    private _startTime = CBA_missionTime;
    
    private _position = (_player1) getPos [5, getDir _player1];
    private _classname = [_type] call grad_cultist_fnc_cultistSpawnGetClassname;
    private _begPos = positionCameraToWorld [0,0,0];
	private _begPosASL = AGLToASL _begPos;
	private _endPos = positionCameraToWorld [0,0,5];
	private _endPosASL = AGLToASL _endPos;
    private _ins = lineIntersectsSurfaces [_begPosASL, _endPosASL, player, objNull, true, 1, "VIEW", "NONE"];
    if (count _ins > 1) exitWith {
        _player1 setVariable ["cultist_manaDrain", false, true]; 
        ["Not enough space."] remoteExec ["CBA_fnc_notify", _player1];
    };
    private _placeholder = createVehicle ["Land_HelipadEmpty_F", _position, [], 0, "CAN_COLLIDE"];
    _placeholder setVariable ["cultist_ritualInvolved", [_player1], true];
    _placeholder setVariable ["cultist_type", _type, true];

    [_player1, _placeholder] remoteExec ["grad_cultist_fnc_cultistRitualEH", _player1];
    
    private _sound = selectRandom ["phase1_trance_1_source", "phase1_trance_2_source"];
    [_player1, _placeholder, _type, _sound, true, _type == "resurrect"] remoteExec ["grad_cultist_fnc_cultistSpawnFX_local"];

    private _duration = [_type] call grad_cultist_fnc_cultistGetSpawnDuration;


    private _bodies = [];
    if (_type == "resurrect") then {
        _bodies = allDeadMen select { _x distance _player1 < 50 }; 
        [_player1, _bodies] remoteExec ["grad_cultist_fnc_cultistSpawnFX_resurrectFX"];
        diag_log format ["found %1 dead bodies to resurrect", count _bodies];
    };

    [{
        params ["_args", "_handle"];
        _args params ["_player1", "_startTime", "_duration", "_position", "_type", "_placeholder", "_bodies"];

        private _playersInvolved = _placeholder getVariable ["cultist_ritualInvolved", []];
        private _playersCount = count _playersInvolved;
        private _playersInvolvedNow = _placeholder getVariable ["cultist_ritualInvolved", []];
        private _playersCountInvolvedNow = count _playersInvolvedNow;
        private _playersNew = _playersInvolved arrayIntersect _playersInvolvedNow;

        if (_playersCount < _playersCountInvolvedNow) then {
            private _newPlayers = _playersInvolvedNow - _playersInvolved;
            {
                private _playerName = [_x, false, true] call ace_common_fnc_getName; 
                [_playerName + " joined ritual"] remoteExec ["CBA_fnc_notify", _playersInvolvedNow];
            } forEach _newPlayers;
            {
                _playersInvolvedNow setVariable ["cultist_ritualInvolved", _playersCountInvolvedNow, true];
            } forEach _playersInvolvedNow;
        };

        if (_playersCount > _playersCountInvolvedNow) then {
            private _playersThatLeft = _playersInvolved - _playersInvolvedNow;
            {
                private _playerName = [_x, false, true] call ace_common_fnc_getName; 
                [_playerName + " left ritual"] remoteExec ["CBA_fnc_notify", _playersInvolvedNow]; 
            } forEach _playersThatLeft;
            {
                _playersInvolvedNow setVariable ["cultist_ritualInvolved", _playersCountInvolvedNow, true];
            } forEach _playersInvolvedNow;
        };

        // successfully incantated monster
        if (CBA_missionTime > (_startTime + _duration)) exitWith {
            diag_log "ritual successful: initiating " + _type + " spawn";
            { ["Ritual successful."] remoteExec ["CBA_fnc_notify", _x]; 
            _x setVariable ["cultist_manaDrain", false, true]; } forEach _playersInvolvedNow;

            switch (_type) do {
                case "resurrect": {
                    [_position, _bodies] call grad_cultist_fnc_cultistResurrectUnits;
                };
                case "sense": { };
                default {
                    [_position, _type] call grad_cultist_fnc_cultistSpawnUnit;
                };
            };

            ["grad_missionControl_curatorInfo",[_player1, _type]] call CBA_fnc_serverEvent;
            deleteVehicle _placeholder;
            [_handle] call CBA_fnc_removePerFrameHandler;
            
        };

        // if singer quits, set his manaDrain to false
        if (_playersCountInvolvedNow < 1) exitWith {
            diag_log "ritual: completely aborted";
            { ["Ritual aborted by initiator."] remoteExec ["CBA_fnc_notify", _x]; _x setVariable ["cultist_manaDrain", false, true]; } forEach _playersInvolved;
            [_handle] call CBA_fnc_removePerFrameHandler;
            deleteVehicle _placeholder;
        };

        // store new player count for next cycle
        _placeholder setVariable ["cultist_ritualInvolved", _playersInvolvedNow, true];

    }, 0, [_player1, _startTime, _duration, _position, _type, _placeholder, _bodies]] call CBA_fnc_addPerFrameHandler;

}] call CBA_fnc_addEventhandler;

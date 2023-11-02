if !(canSuspend) exitWith { _this remoteExec [_fnc_scriptName, player]; };

private _duration = ["sense"] call grad_cultist_fnc_cultistGetSpawnDuration;
private _enemySides = [west, independent];
private _enemies = allUnits select { ((side _x) in _enemySides) && (isNull (getAssignedCuratorLogic _x)) };
if (count _enemies < 0) exitWith {
	hint "There are no enemies nearby!";
};
private _nearest = ([_enemies, [], { _x distance player }, "ASCEND"] call BIS_fnc_sortBy) # 0;
private _soundDist = (player distance _nearest) * 3;
_nearest say3D ["whispers", _soundDist, 1, false];
if (isPlayer _nearest) then {
	[player, ["whispers", _soundDist, 1, false]] remoteExec ["say3D", _nearest];
};		

[
	{
		params ["_args", "_handle"];
		_args params ["_enemy", "_startTime", "_duration"];				

		private _endTime = _startTime + _duration;
		if (CBA_missionTime > _endTime) exitWith {
			systemChat "removing sense-pfh";
			[_handle] call CBA_fnc_removePerFrameHandler;
		};

		// marker gets dimmer over duration
		private _alpha = (_endTime - CBA_missionTime) / (_endTime - _startTime);
		drawIcon3D
		[
			getMissionPath "data\interact_sense.paa",
			[138/256, 3/256, 3/256, _alpha],
			getPos _enemy,
			2,
			2,
			0,
			format["%1m", round(player distance _enemy)],
			0,
			0.08,
			"Caveat",
			"center",
			true
		];
	},
	0,
	[_nearest, CBA_missionTime, 20]
] call CBA_fnc_addPerFrameHandler;

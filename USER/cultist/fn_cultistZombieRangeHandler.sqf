#include "script_macros.hpp"

[
	{
		params ["_args", "_handle"];

		private _spawnedZombies = player getVariable ["grad_cultist_zombiesSpawned", []];
		private _aliveZombies = _spawnedZombies select { alive _x };
		{
			if ((_x distance2D player) > MAX_ZOMBIE_RANGE) then {
				_x setDamage 1;
				[position _x, 3] remoteExec ["grad_cultist_fnc_cultistSpawnFX_fog", 0];
			};
		} forEach _aliveZombies;
	},
	5,
	[]
] call CBA_fnc_addPerFrameHandler;
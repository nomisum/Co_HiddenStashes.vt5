#include "script_macros.hpp"

[
	{
		params ["_args", "_handle"];

		private _spawnedZombies = player getVariable ["grad_cultist_zombiesSpawned", []];
		private _aliveZombies = _spawnedZombies select { alive _x };
		{
			if ((_x distance2D player) > MAX_ZOMBIE_RANGE) then {
				systemChat format["killing %1 | range: %2", _x, _x distance2D player];
				_x setDamage 1;				
			};
		} forEach _aliveZombies;
	},
	5,
	[]
] call CBA_fnc_addPerFrameHandler;
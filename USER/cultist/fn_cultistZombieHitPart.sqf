params ["_unit"];

_unit addEventHandler ["HitPart", {  //-- Exploding head and health modifier
	(_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];
	_caliber = _ammo#0;
	_damageToApply = _caliber / 10;
	_damageToApply = _damageToApply/dev_zombie_health;
	_target setVariable ["damage", (_target getVariable ["damage", 0]) + _damageToApply];  //-- Only used here
	if (_target getVariable ["damage", 0] > 1) then {_target setDamage 1};
	if ("head" in _selection && _caliber > dev_zombie_head_caliber && !(_target getVariable ["decap", false]) && random 1 <= dev_zombie_head_chance) then {
		_target setVariable ["decap", true, true];  //-- Only used here
		[_target] spawn dev_fnc_decapitate;
		_target setDamage 1;
	};
}];
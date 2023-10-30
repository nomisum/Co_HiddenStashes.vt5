// todo

params ["_position", "_bodies"];

{
	// check if body still there
	private _body = _x;

	if (!isNull _body) then {

		(getModelInfo _body) params ["_model"];
		
		private _classname = [_model] call grad_cultist_fnc_cultistZombieForModel;

		if (_classname != "") then {
			private _position = getPos _body;
			private _dir = getDir _body;
			
			private _grp = creategroup east; // hardcoded for now
			private _unit = _grp createUnit [_classname, _position, [], 0, "CAN_COLLIDE"];
			_unit setDir _dir;
			_grp deleteGroupWhenEmpty true;

			deleteVehicle _body;
		};
	};

} forEach _bodies;
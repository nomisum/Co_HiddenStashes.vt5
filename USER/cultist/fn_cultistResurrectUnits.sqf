// todo

params ["_position", "_bodies"];

diag_log format ["entering resurrectunits %1", _bodies];

{
	// check if body still there
	private _body = _x;

	diag_log format ["body %1", _body];

	if (!isNull _body) then {

		(getModelInfo _body) params ["_model"];
		
		private _classname = [_model] call grad_cultist_fnc_cultistZombieForModel;

		diag_log format ["resurrecting %1 with model %2", _classname, _model];

		if (_classname != "") then {
			private _position = getPos _body;
			private _dir = getDir _body;
			
			private _grp = creategroup east; // hardcoded for now
			private _unit = _grp createUnit [_classname, _position, [], 0, "CAN_COLLIDE"];
			_unit setDir _dir;
			[_unit, "AmovPercMstpSnonWnonDnon_SaluteOut"] remoteExec ["switchmove", 0];
			_grp deleteGroupWhenEmpty true;

			deleteVehicle _body;
		};
	};

} forEach _bodies;
// todo

params ["_position", "_bodies"];

diag_log format ["entering resurrectunits %1", _bodies];

private _grp = creategroup east; // hardcoded for now

{
	// check if body still there
	private _body = _x;
	
	[{
		params ["_body", "_grp"];
		diag_log format ["body %1", _body];

		if (!isNull _body) then {

			
			
			private _classname = [_body] call grad_cultist_fnc_cultistZombieForModel;

			if (_classname != "") then {
				private _position = getPos _body;
				private _dir = getDir _body;
				private _uniform = uniform _body;
				private _goggles = goggles _body;
				private _headgear = headgear _body;
				private _vest = vest _body;
				private _backpack = backpack _body;
				private _items = items _body;
				private _mags = magazinesAmmoFull _body;
				private _primaryWeapon = primaryWeapon _body;
				private _secondaryWeapon = secondaryWeapon _body;

				
				
				private _unit = _grp createUnit [_classname, _position, [], 0, "CAN_COLLIDE"];

				_unit setDir _dir;
				[_unit, "AmovPercMstpSnonWnonDnon_SaluteOut"] remoteExec ["switchmove", 0];
				[_position, 3] remoteExec ["grad_cultist_fnc_cultistSpawnFX_fog"];
				_unit setVariable ["lambs_danger_disableAI", true];  
				
				// _grp deleteGroupWhenEmpty true;

				{
					_x addCuratorEditableObjects [[_unit],true];
					nil
				} count allCurators;

				_unit addHeadgear _headgear;
				_unit addVest _vest;
				_unit addBackpack _backpack;
				_unit addGoggles _goggles;

				 {
					if (_unit canAddItemToUniform [_x, 1]) then {
						_unit addItemToUniform _x;
					} else {
						if (_unit canAddItemToVest [_x, 1]) then {
								_unit addItemToVest _x;
							} else {
								if (_unit canAddItemToBackpack [_x, 1]) then {
									_unit addItemToBackpack _x;
									} else {
									private _holder = "GroundWeaponHolder" createVehicle _position;
									_holder addItemCargoGlobal [_x, 1];
								};
						};
					};
				} forEach _items;

				{
					private _mag = _x select 0;
					if (_unit canAddItemToUniform [_mag, 1]) then {
						_unit addItemToUniform _mag;
					} else {
						if (_unit canAddItemToVest [_mag, 1]) then {
								_unit addItemToVest _mag;
							} else {
								if (_unit canAddItemToBackpack [_mag, 1]) then {
									_unit addItemToBackpack _mag;
									} else {
									private _holder = "GroundWeaponHolder" createVehicle _position;
									_holder addItemCargoGlobal [_mag, 1];
								};
						};
					};
				} forEach _mags;

				if (_primaryWeapon != "") then {
					private _holder = "GroundWeaponHolder" createVehicle _position;
					_holder addWeaponCargoGlobal [_primaryWeapon, 1];
				};

				if (_secondaryWeapon != "") then {
					private _holder = "GroundWeaponHolder" createVehicle _position;
					_holder addWeaponCargoGlobal [_secondaryWeapon, 1];
				};

				deleteVehicle _body;
			};
		};
	}, [_body, _grp], random 2] call CBA_fnc_waitAndExecute;

} forEach _bodies;
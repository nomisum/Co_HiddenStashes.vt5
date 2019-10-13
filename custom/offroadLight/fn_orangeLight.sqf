/*
    
*/

params ["_car"];

fnc_SetPitchBankYaw = { 
    private ["_object","_rotations","_aroundX","_aroundY","_aroundZ","_dirX","_dirY",
    "_dirZ","_upX","_upY","_upZ","_dir","_up","_dirXTemp","_upXTemp"];
    _object = _this select 0; 
    _rotations = _this select 1; 
    _aroundX = _rotations select 0; 
    _aroundY = _rotations select 1; 
    _aroundZ = (360 - (_rotations select 2)) - 360; 
    _dirX = 0; 
    _dirY = 1; 
    _dirZ = 0; 
    _upX = 0; 
    _upY = 0; 
    _upZ = 1; 
    if (_aroundX != 0) then { 
        _dirY = cos _aroundX; 
        _dirZ = sin _aroundX; 
        _upY = -sin _aroundX; 
        _upZ = cos _aroundX; 
    }; 
    if (_aroundY != 0) then { 
        _dirX = _dirZ * sin _aroundY; 
        _dirZ = _dirZ * cos _aroundY; 
        _upX = _upZ * sin _aroundY; 
        _upZ = _upZ * cos _aroundY; 
    }; 
    if (_aroundZ != 0) then { 
        _dirXTemp = _dirX; 
        _dirX = (_dirXTemp* cos _aroundZ) - (_dirY * sin _aroundZ); 
        _dirY = (_dirY * cos _aroundZ) + (_dirXTemp * sin _aroundZ);        
        _upXTemp = _upX; 
        _upX = (_upXTemp * cos _aroundZ) - (_upY * sin _aroundZ); 
        _upY = (_upY * cos _aroundZ) + (_upXTemp * sin _aroundZ);       
    }; 
    _dir = [_dirX,_dirY,_dirZ]; 
    _up = [_upX,_upY,_upZ]; 
    _object setVectorDirAndUp [_dir,_up]; 
};  


private _position = [0.4,-0.2,0.15];





private _reflectorOrange = "Reflector_Cone_01_narrow_Orange_F" createVehicleLocal [0,0,0];
_reflectorOrange attachTo [_car, _position];


private _reflectorOrange2 = "Reflector_Cone_01_wide_Orange_F" createVehicleLocal [0,0,0];
_reflectorOrange attachTo [_car, _position];



[{
    params ["_args", "_handle"];
    _args params [
        "_car",
        "_reflectorOrange",
        "_reflectorOrange2"
    ];


    if (!(_car getVariable ["GRAD_offroadOrangeLight", false]) || isNull _car || !alive _car) exitWith {
    
        {
          deleteVehicle _x;
        } forEach [
            _reflectorOrange,
            _reflectorOrange2
        ];
        
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    private _rotation = _car getVariable ["rotation", 0];
    _rotation = _rotation + 6;
    _car setVariable ["rotation", _rotation];

   
    [_reflectorOrange,[0,0,_rotation+270]] call fnc_SetPitchBankYaw;
    
    [_reflectorOrange2,[0,0,_rotation+90]] call fnc_SetPitchBankYaw;

}, 0, [
    _car, 
    _reflectorOrange, 
    _reflectorOrange2
    ]
] call CBA_fnc_addPerFrameHandler;
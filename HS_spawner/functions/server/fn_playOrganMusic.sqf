params ["_position"];

private _dummy = "#particlesource" createVehicleLocal _position;
_dummy say3D "organ";

_dummy spawn {
    sleep 72; //Atleast the length of your sound
    deleteVehicle _this;
};
params ["_zombie"];

[_zombie, selectRandom ["RyanZombieFace1", "RyanZombieFace2", "RyanZombieFace3", "RyanZombieFace4", "RyanZombieFace5", "RyanZombieFace6"]] remoteExec ["setFace", 0, _zombie];
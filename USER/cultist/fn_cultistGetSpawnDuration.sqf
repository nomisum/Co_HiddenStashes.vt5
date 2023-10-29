params ["_type"];

private _duration = 10;

switch (_type) do {
	case "walker": { _duration = 10; };
	case "zombie": { _duration = 5; };
	case "spider": { _duration = 15; };
	case "demon": { _duration = 30; };
	default { };
};

_duration
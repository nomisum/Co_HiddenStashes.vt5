params ["_type"];

private _duration = 10;

switch (_type) do {
	case "walker": { _duration = 5; };
	case "zombie": { _duration = 1; };
	case "spider": { _duration = 10; };
	case "demon": { _duration = 20; };
	default { };
};

_duration
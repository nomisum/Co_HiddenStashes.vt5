#define UI_GRID_W (pixelW * pixelGrid) // One grid width
#define UI_GRID_H (pixelH * pixelGrid) // One grid height
#define UI_GUTTER_W (pixelW * 2)       // One “gutter” width
#define UI_GUTTER_H (pixelH * 2)       // One “gutter” height

// todooooo remove hardcoded values
// Create box in the top right corner, with ¼ gutter spacing

  private _x = safeZoneX + safeZoneW - UI_GRID_W * 10; // Top right corner with gutter
  private _y = safeZoneY + + safeZoneH - UI_GRID_H * 3;              // Top right corner with gutter
  private _w = UI_GRID_W * 20;                            // Width of control
  private _h = UI_GRID_H * 2;                             // Height of control


private _manaBarControls = [];

private _manaBarBG = findDisplay 46 ctrlCreate ["RscStructuredText", -1];

_manaBarBG ctrlSetPosition [_x, _y, _w, _h];
_manaBarBG ctrlSetBackgroundColor [0,0,0,0.5];
_manaBarBG ctrlCommit 0;
_manaBarControls pushback _manaBarBG;


private _manaBar = findDisplay 46 ctrlCreate ["RscStructuredText", -1];

_manaBar ctrlSetPosition [_x, _y, _w, _h];
_manaBar ctrlSetBackgroundColor [0,0,0,0.5];
_manaBar ctrlCommit 0;
_manaBarControls pushback _manaBar;


private _manaText = findDisplay 46 ctrlCreate ["RscStructuredText", 1337];
_manaText ctrlSetPosition [_x, _y, _w, _h*3];
_manaText ctrlSetStructuredText (parseText "<t size='.1' color='#ffffffff' align='center'> MANA</t>");
_manaText ctrlCommit 0;
_manaBarControls pushback _manaText;


[{
  params ["_args", "_handle"];
  _args params ["_manaBarControls"];

  if (!alive player) then {
      {  _x ctrlShow false; } forEach _manaBarControls;
  } else {
      {  _x ctrlShow true; } forEach _manaBarControls;
  };

  #define UI_GRID_W (pixelW * pixelGrid) // One grid width
  #define UI_GRID_H (pixelH * pixelGrid) // One grid height
  #define UI_GUTTER_W (pixelW * 2)       // One “gutter” width
  #define UI_GUTTER_H (pixelH * 2)       // One “gutter” height

  // Create box in the top right corner, with ¼ gutter spacing

  private _x = safeZoneX + safeZoneW - UI_GRID_W * 30; // Top right corner with gutter
  private _y = safeZoneY + + safeZoneH - UI_GRID_H * 10;              // Top right corner with gutter
  private _w = UI_GRID_W * 20;                            // Width of control
  private _h = UI_GRID_H * 2;                             // Height of control

  private _manaValue = linearConversion [0, 1, player getVariable ["cultist_manaValue", 1], 0, 1, true];
  private _manaColor = if (_manaValue < 1) then { [0.02,0.44,0.81,1] } else { [0.22,0.81,0.22,1] };
  // systemChat str _manaValue;

  _manaBarControls params ["", "_manaBar", "_manaText"];
  _manaBar ctrlSetPosition [_x, _y, _w * _manaValue, _h];
  _manaBar ctrlSetBackgroundColor _manaColor;
  _manaBar ctrlCommit 0.2;
 
  private _valueString = (str (_manaValue * 100)) + "%";
  _manaText ctrlSetPosition [_x, _y, _w, _h];
  _manaText ctrlSetStructuredText (parseText ("<t size='1' color='#ffffffff' align='center'>" + _valueString + " MANA</t>"));
  _manaText ctrlCommit 0;

}, 0.2, [_manaBarControls]] call CBA_fnc_addPerFrameHandler;

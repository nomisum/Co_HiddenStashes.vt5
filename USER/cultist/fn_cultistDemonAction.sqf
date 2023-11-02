if (!hasInterface) exitWith {};
private _action = ["Ritual", "Ritual", "data\interact_cultist.paa", {
        
    },{
        player getVariable ["GRAD_isCultist", false] &&
        !(player getVariable ["cultist_manaDrain", false]) &&
        isNull attachedTo player 
    }] call ace_interact_menu_fnc_createAction;
    
[(typeOf player), 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToClass;

private _teleportAction =
[
  "Teleport",
  "Teleport (needs 100% Mana)",
   "data\interact_teleport.paa",
  {
      if (player getVariable ["cultist_manaValue", 0] < 1) exitWith {
          ["Low on mana!"] call CBA_fnc_notify;
      };

       if (count (weapons player) > 0) exitWith {
            ["Drop your weapons and binos to use magic!"] call CBA_fnc_notify;
      };
      [] call grad_cultist_fnc_cultistTeleportSelect;
  },
  {
      player getVariable ["GRAD_isCultist", false] &&
      !(player getVariable ["cultist_manaDrain", false])
  },
  {}
] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions", "Ritual"], _teleportAction] call ace_interact_menu_fnc_addActionToClass;

private _zombieAction =
[
  "Zombie",
  "Zombie (20% Mana)",
  "data\interact_zombie.paa",
  {
      if (player getVariable ["cultist_manaValue", 0] < 0.2) exitWith {
          ["Low on mana!"] call CBA_fnc_notify;
      };

       if (count (weapons player) > 0) exitWith {
            ["Drop your weapons and binos to use magic!"] call CBA_fnc_notify;
      };
      [player, "zombie"] call grad_cultist_fnc_cultistMultiSpawnStart;
  },
  {
      player getVariable ["GRAD_isCultist", false] &&
      !(player getVariable ["cultist_manaDrain", false]) &&
      isNull attachedTo player 
  },
  {}
] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions", "Ritual"], _zombieAction] call ace_interact_menu_fnc_addActionToClass;




private _spiderAction =
[
  "Spider",
  "Spider (30% Mana)",
  "data\interact_mutant.paa",
  {
      if (player getVariable ["cultist_manaValue", 0] < 0.3) exitWith {
          ["Low on mana!"] call CBA_fnc_notify;
      };

       if (count (weapons player) > 0) exitWith {
            ["Drop your weapons and binos to use magic!"] call CBA_fnc_notify;
      };
      [player, "spider"] call grad_cultist_fnc_cultistMultiSpawnStart;
  },
  {
      player getVariable ["GRAD_isCultist", false] &&
      !(player getVariable ["cultist_manaDrain", false]) &&
      isNull attachedTo player 
  },
  {}
] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions", "Ritual"], _spiderAction] call ace_interact_menu_fnc_addActionToClass;


private _walkerAction =
[
  "Walker",
  "Walker (20% Mana)",
  "data\interact_bully.paa",
  {
      if (player getVariable ["cultist_manaValue", 0] < 0.2) exitWith {
          ["Low on mana!"] call CBA_fnc_notify;
      };

       if (count (weapons player) > 0) exitWith {
            ["Drop your weapons and binos to use magic!"] call CBA_fnc_notify;
      };
      [player, "walker"] call grad_cultist_fnc_cultistMultiSpawnStart;
  },
  {
      player getVariable ["GRAD_isCultist", false] &&
      !(player getVariable ["cultist_manaDrain", false]) &&
      isNull attachedTo player 
  },
  {}
] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions", "Ritual"], _walkerAction] call ace_interact_menu_fnc_addActionToClass;


private _resurrectAction =
[
  "Resurrect",
  "Resurrect dead around you (100% Mana)",
  "data\interact_cultist.paa",
  {
      if (player getVariable ["cultist_manaValue", 0] < 1) exitWith {
          ["Low on mana!"] call CBA_fnc_notify;
      };

       if (count (weapons player) > 0) exitWith {
            ["Drop your weapons and binos to use magic!"] call CBA_fnc_notify;
      };
      [player, "resurrect"] call grad_cultist_fnc_cultistMultiSpawnStart;
  },
  {
      player getVariable ["GRAD_isCultist", false] &&
      !(player getVariable ["cultist_manaDrain", false]) &&
      isNull attachedTo player 
  },
  {}
] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions", "Ritual"], _resurrectAction] call ace_interact_menu_fnc_addActionToClass;


private _senseEnemy =
[
  "Sense",
  "Sense nearest enemy (75% Mana)",
  "data\interact_sense.paa",
  {
      if (player getVariable ["cultist_manaValue", 0] < 0.75) exitWith {
          ["Low on mana!"] call CBA_fnc_notify;
      };

       if (count (weapons player) > 0) exitWith {
            ["Drop your weapons and binos to use magic!"] call CBA_fnc_notify;
      };
      
      [player, "sense"] call grad_cultist_fnc_cultistMultiSpawnStart;
  },
  {
      player getVariable ["GRAD_isCultist", false] &&
      !(player getVariable ["cultist_manaDrain", false]) &&
      isNull attachedTo player 
  },
  {}
] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions", "Ritual"], _senseEnemy] call ace_interact_menu_fnc_addActionToClass;

/*
private _helpRitualAction =
[
  "joinRitual",
  "Join Ritual",
  "data\interact_demon.paa",
  {
      if (player getVariable ["cultist_manaValue", 0] < 0.9) exitWith {
          ["Low on mana!"] call CBA_fnc_notify;
      };
       if (count (weapons player) > 0) exitWith {
            ["Drop your weapons and binos to use magic!"] call CBA_fnc_notify;
      };

      private _existingRitual = [player] call grad_cultist_fnc_cultistGetNearestRitual;
      private _type = _existingRitual getVariable ["cultist_type", "horse"];
      private _involvedPlayers = _existingRitual getVariable ["cultist_ritualInvolved", []];
      _involvedPlayers pushBackUnique player;
      _existingRitual setVariable ["cultist_ritualInvolved", _involvedPlayers, true];
      [player, _existingRitual] call grad_cultist_fnc_cultistRitualEH;
      private _sound = selectRandom ["phase1_trance_1_source", "phase1_trance_2_source"];
      [player, _existingRitual, _type, _sound, false] remoteExec ["grad_cultist_fnc_cultistSpawnFX_local"];
  },
  {
      player getVariable ["GRAD_isCultist", false] &&
      !(player getVariable ["cultist_manaDrain", false]) &&
      isNull attachedTo player &&
      { !isNull ([player] call grad_cultist_fnc_cultistGetNearestRitual) }
  },
  {}
] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions", "Ritual"], _helpRitualAction] call ace_interact_menu_fnc_addActionToClass;
*/

private _nightVisionOn =
[
  "GetNightVision",
  "Switch to Night Vision",
  "",
  {
      player action ["nvGoggles", player];
      player setVariable ["cultist_nvg", true, true];
  },
  {
      player getVariable ["GRAD_isCultist", false] &&
      currentVisionMode player == 0 &&
      isNull attachedTo player
  },
  {}
] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions"], _nightVisionOn] call ace_interact_menu_fnc_addActionToClass;

private _nightVisionOff =
[
  "DisableNightVision",
  "Disable Night Vision",
  "",
  {
      player action ["nvGogglesOff", player];
      player setVariable ["cultist_nvg", false, true];
  },
  {
      player getVariable ["GRAD_isCultist", false] &&
      currentVisionMode player == 1 &&
      isNull attachedTo player
  },
  {}
] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions"], _nightVisionOff] call ace_interact_menu_fnc_addActionToClass;

private _senseEnemy =
[
  "DisableNightVision",
  "Disable Night Vision",
  "",
  {
      player action ["nvGogglesOff", player];
      player setVariable ["cultist_nvg", false, true];
  },
  {
      player getVariable ["isCultist", false] &&
      currentVisionMode player == 1 &&
      isNull attachedTo player
  },
  {}
] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions"], _senseEnemy] call ace_interact_menu_fnc_addActionToClass;


/*
private _action = ["exitToSpectator", "Spectator", "data\interact_cultist.paa", {
        
    },{
        player getVariable ["GRAD_isCultist", false]
    }] call ace_interact_menu_fnc_createAction;
    
[(typeOf player), 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToClass;


private _exitToSpectator =
[
  "exitToSpectator2",
  "Exit to Spectator (You can not undo this!)",
  "",
  {
      ["Initialize", [player, [], true]] call BIS_fnc_EGSpectator;
  },
  {
      player getVariable ["GRAD_isCultist", false]
  },
  {}
] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions", "exitToSpectator"], _exitToSpectator] call ace_interact_menu_fnc_addActionToClass;
*/
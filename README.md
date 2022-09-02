# Rushpoint Utilities

Extremely Basic Player Utilities designed to support the roblox game [Rushpoint](https://www.roblox.com/games/5993942214/NEW-UPDATE-Rush-Point)

Created this because:
- Rushpoint has a really easily bypassable anticheat
- There is a lack of working free scripts for Rushpoint

If you're new to Lua and don't know how to use this, [I've created an example ESP/wallhack script](https://github.com/dragonssk/rushpoint-utilities/blob/main/example.lua) that is fully open-sourced with notes and explanations.

Make your own cheats, it's really easy.

*Obfuscated because Axillary Studios likes to lurk and patch open-sourced releases*

# Documentation

## Grabbing the utilities
```lua
local utilties = loadstring(game:HttpGet('https://raw.githubusercontent.com/dragonssk/rushpoint-utilities/main/main.lua'))('github.com/dragonssk');
```
Returns the utilties table.

## Grabbing Character Info
```lua
<table> utilties:getCharacter(<player> player); -- Please note the fact that Rushpoint models aren't R6, I've only organized their limbs that way.
```
If the player character exists, returns:
```lua
<table> {
  Character = <model>Character;
  Head = <part>Head;
  Torso = <part>Torso;
  LeftArm = <part>Left Arm;
  RightArm = <part>Right Arm;
  LeftLeg = <part>Left Leg;
  RightLeg = <part>Right Leg;
  Health = <int>Health;
  Gun = <string>Gun;
};
```
Else; returns `nil`

## Grabbing Player Info
```lua
<string>utilities:getTeam(<player> player);
```
If the player has a team, returns
```lua
<string> playerTeam
```
Else; returns `'None'`

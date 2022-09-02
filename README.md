# Rushpoint Utilities

Extremely Basic Player Utilities designed to support the roblox game [Rushpoint](https://www.roblox.com/games/5993942214/NEW-UPDATE-Rush-Point)

Made this due to people selling extremely basic ass aimbot and esp scripts for dumb amounts of money, and lots of people buying them

Make your own cheats, it's really easy.

# Loading Utilties

## Grabbing the utilities
```lua
local utilties = loadstring(game:HttpGet('https://raw.githubusercontent.com/dragonssk/rushpoint-utilities/main/main.lua'))('github.com/dragonssk dragons#9500');
```
Returns the utilties table.

## Grabbing Character Info
```lua
<table> utilties:getCharacter(<player> player);
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

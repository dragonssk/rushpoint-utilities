# Rushpoint Utilities

Extremely Basic Player Utilities designed to support the Roblox Valorant clone game [Rushpoint](https://www.roblox.com/games/5993942214/NEW-UPDATE-Rush-Point)

Created this because:
- Rushpoint has a really easily bypassable anticheat
- There is a lack of working free scripts for Rushpoint

If you're new to Lua and don't know how to use this, [I've created an example ESP/wallhack script](https://github.com/dragonssk/rushpoint-utilities/blob/main/example.lua) that is fully open-sourced with notes and explanations.

*Obfuscated because Axillary Studios likes to lurk and patch open-sourced releases*

Update (9/03/22)

It looks like Axillary Studios tried to push an update to patch this, nice try though

# Documentation

## Grabbing the utilities
```lua
local utilties = loadstring(game:HttpGet('https://raw.githubusercontent.com/dragonssk/rushpoint-utilities/main/main.lua'))('github.com/dragonssk');
```
Returns the utilties table.

## Grabbing Character Info
```lua
function utilities:getCharacter(player: Player): table
    return {
        Character: Model = char
	Head: BasePart = head
        Torso: BasePart = torso
        LeftLeg: BasePart = leftLeg
        LeftArm: BasePart = leftArm
        RightLeg: BasePart = rightLeg
        RightArm: BasePart = rightArm
        Health: number = health
        Gun: string = gunName
    }
end
```
Make sure to check that the character isn't `nil` in your scripts!
## Grabbing Player Info
```lua
function utilities:getTeam(player: Player): string
    return playerTeam
end
```
I don't believe you have to check `nil` teams, but I still recommend it because it's a resolution in the library

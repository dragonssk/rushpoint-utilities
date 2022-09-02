-- Example ESP Script for Rushpoint Utilties
-- https://github.com/dragonssk/rushpoint-utilities
-- If you distribute this source code on external websites, please provide credit to the original Github repository.

local utilities      = loadstring(game:HttpGet('https://raw.githubusercontent.com/dragonssk/rushpoint-utilities/main/main.lua'))('github.com/dragonssk');
local playerService = game:GetService('Players');
local runService    = game:GetService('RunService');
local localPlayer   = playerService.LocalPlayer;
local camera        = workspace.CurrentCamera;

-- Player ESP Management
local espObjects = {};
local function create_esp(player)
    espObjects[player] = {};
    local eo = espObjects[player];
    eo.info = Drawing.new('Text'); local eoi = eo.info;
    eo.dot = Drawing.new('Circle'); local eod = eo.dot;
    eoi.Transparency = 1; eod.Transparency = 1;
    eoi.Visible = true; eod.Visible = true;
    eoi.ZIndex = 2; eod.ZIndex = 1;

    eoi.Font = Drawing.Fonts.Plex;
    eoi.Outline = true;
    eoi.Size = 13;
    eoi.Center = true;
    eoi.Color = Color3.new(1, 1, 1);

    eod.Radius = 2;
    eod.Thickness = 0;
    eod.Filled = true;
    eod.NumSides = 50;
    eod.Color = Color3.new(1, 0, 0);
end;

local function destroy_esp(player)
    for _, object in pairs(espObjects[player]) do
        object:Remove();
    end;
    espObjects[player] = nil;
end;

local function esp_visible(player, boolean)
    for _, object in pairs(espObjects[player]) do
        object.Visible = boolean;
    end;
end;

-- Example ESP Script for Rushpoint Utilties
-- https://github.com/dragonssk/rushpoint-utilities
-- If you distribute this source code on external websites, please provide credit to the original Github repository.

-- Automatically create and destroy ESP objects
for _, player in pairs(playerService:GetPlayers()) do create_esp(player); end;
playerService.PlayerAdded:Connect(function(player) create_esp(player); end);
playerService.PlayerRemoving:Connect(function(player) destroy_esp(player); end);

runService.RenderStepped:Connect(function()
    for _, player in pairs(playerService:GetPlayers()) do
        esp_visible(player, false); -- This is a shortcut to make sure players off-screen aren't visible, without having to check.
        if (utilities:getTeam(player) ~= utilities:getTeam(localPlayer)) then -- Makes sure the player is an enemy, using the utilities library!
            local playerCharacter = utilities:getCharacter(player) -- Getting the character info, using the utilities library!
            if (playerCharacter) then -- Checking if the player has a currently spawned in player
                local headVector3, headVisible = camera:WorldToViewportPoint(playerCharacter.Head.Position); -- Where the player's head is on the screen, and if it is on the screen.
                if (headVisible) then -- Checking if the player's character is currently visible from the camera's FOV.
                    esp_visible(player, true); -- The player has a character that is visible! We will now enable ESP objects to be visible
                    local playerEO = espObjects[player];
                    playerEO.dot.Position = Vector2.new(headVector3.X, headVector3.Y); -- We are now updating the ESP objects to be accurate to the character's position!
                    playerEO.info.Position = playerEO.dot.Position + Vector2.new(0, 13+3);
                    playerEO.info.Text = tostring(playerCharacter.Health)..' HP ('..playerCharacter.Gun..')'; -- Changing the player info to be accurate!
                    -- Example ESP Script for Rushpoint Utilties
                    -- https://github.com/dragonssk/rushpoint-utilities
                    -- If you distribute this source code on external websites, please provide credit to the original Github repository.
                end;
            end;
        end;
    end;
end);

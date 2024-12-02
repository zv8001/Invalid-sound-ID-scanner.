--[[
A simple plugin to scan the game for invalid sound IDs and changes the audios sound ID to nothing.
Preventing a bunch of sound ID errors in your console.
]]

local ChangeHistoryService = game:GetService("ChangeHistoryService")
local Selection = game:GetService("Selection")
local toolbar = plugin:CreateToolbar("Remove console sound errors")
local OpenGUIButton = toolbar:CreateButton("Remove console sound errors", "Remove console sound errors", "rbxassetid://6745884818")

local function OnClick() --This function checks for invalid sound IDs 
	warn("Removing invalid sound IDs please wait...")
	local children = game:GetDescendants()
	for i, child in ipairs(children) do
		if child:IsA("Sound") then
			if child.TimeLength == 0 then --Checks to see if the sound is invalid.
				if child.SoundId ~= "" then --Makes sure it's not repeating Sounds.
					warn("Changing sound ID to nil: " .. child.SoundId)
					child.SoundId = "" --set the sound ID to nothing
				end
			end
		end
	end
	warn("Done")
end
OpenGUIButton.Click:Connect(OnClick)

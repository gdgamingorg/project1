local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local items = {"Energy Sword", "Text Sign", "Medieval Torch", "Linked Sword", "Cheeseburger", "Image Sign", "Troll Juice", "Popcorn", "Steel Katana", "Paintbrush", "Pencil", "Spoon", "Shrinking Potion", "Candy Bag", "Predator Katana", "Mist Bottle", "SCP Card", "Coffee", "Pepperoni Pizza", "Sorcus Sword", "Taco", "Witches Brew", "Shiny Sword", "Bloxy Cola", "Battle Axe", "Pirate Juice", "Birthday Cake", "Chocolate Milk", "Illumina", "Cavalry Sword"}

	--playerSECTION
	local Window = Library.CreateLib("GRP Hub", "Ocean")
	local Tab = Window:NewTab("Player")
	local MainSection = Tab:NewSection("Humanoid")
	local OtherSection = Tab:NewSection("Others")

	--WS
	MainSection:NewSlider("Walk Speed", "Speed of your character", 80, 16, function(s)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
	end)
	--JP
	MainSection:NewSlider("Jump Power", "Jump power of your character", 150, 50, function(s)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
	end)

	OtherSection:NewButton("Sit", "Makes you sit", function()
		game:GetService("Players").LocalPlayer.Character.Humanoid.Sit = true
	end)

	OtherSection:NewButton("Equip all tools", "Equips all tools in your backpack", function()
		local bpTemp = game:GetService("Players").LocalPlayer.Backpack:GetChildren()
		for i, child in ipairs(bpTemp) do
			child.Parent = game:GetService("Players").LocalPlayer.Character
		end
	end)

	OtherSection:NewButton("Remove all tools", "Removes all tools in your backpack", function()
		local curtool = game:GetService("Players").LocalPlayer.Character
		local bpTemp = game:GetService("Players").LocalPlayer.Backpack:GetChildren()
		for i, child in ipairs(bpTemp) do
			child:Destroy()
		end
		if curtool:FindFirstChildOfClass("Tool") then
			curtool:FindFirstChildOfClass("Tool"):Destroy()
		else
			print("no tool is being held")	
		end
	end)

	-- Items sec
	local ItemsTab = Window:NewTab("Store")
	local BuySec = ItemsTab:NewSection("Shop Items")

	--[[Buysec:NewDropdown("Item", "Buy item", items, function(currentOption)
		print(currentOption)
	end) --]]

	BuySec:NewDropdown("Buy shop item", "All shop items buy them", items, function(currentOption)
	local args = {
    [1] = currentOption
	}

	game:GetService("ReplicatedStorage").Remotes.ShopRemote:FireServer(unpack(args))

	end)





	-- teleports
	local TeleportsTab = Window:NewTab("Teleports")
	local PlaceSec = TeleportsTab:NewSection("Places")

	PlaceSec:NewButton("Spawn", "Teleports you to the spawn", function()
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(63.3048058, 6.83962584, 123.299492)
	end)

	PlaceSec:NewButton("Auditorium", "Teleports you to the auditorium", function()
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(82.687088, 4.80853319, 338.457672)
	end)

	PlaceSec:NewButton("Portals", "Teleports you to the portals", function()
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-162.234192, 4.98506403, 122.857643)
	end)

	-- Scripts section
	local ScriptsTab = Window:NewTab("Scripts")
	local FunSec = ScriptsTab:NewSection("Fun Scripts")
	FunSec:NewButton("Infinite Yield", "Admin script", function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	end)
	local InformationSec = ScriptsTab:NewSection("Information Scripts")
	InformationSec:NewButton("Dex Explorer", "Roblox Studio Explorer", function()
		loadstring(game:GetObjects('rbxassetid://2180084478')[1].Source)()
	end)


	-- credits section

	local CreditTab = Window:NewTab("Credits")
	local CreditsSection = CreditTab:NewSection("sc UTILITIES")
	CreditsSection:NewLabel("gust (toe)")

	
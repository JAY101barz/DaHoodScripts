-- Global Variables

-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide
--[[
local ohString1 = "EnterPromoCode"
local ohString2 = "secretcodeinmain"

game:GetService("ReplicatedStorage").MainEvent:FireServer(ohString1, ohString2)
]]

--This script reveals ALL hidden messages in the default chat
--chat "/spy" to toggle!
enabled = true
--if true will check your messages too
spyOnMyself = true
--if true will chat the logs publicly (fun, risky)
public = false
--if true will use /me to stand out
publicItalics = true
--customize private logs
privateProperties = {
	Color = Color3.fromRGB(0,255,255); 
	Font = Enum.Font.SourceSansBold;
	TextSize = 18;
}
--////////////////////////////////////////////////////////////////
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local instance = (_G.chatSpyInstance or 0) + 1
_G.chatSpyInstance = instance

local function onChatted(p,msg)
	if _G.chatSpyInstance == instance then
		if p==player and msg:lower():sub(1,4)=="/spy" then
			enabled = not enabled
			wait(0.3)
			privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
			StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
		elseif enabled and (spyOnMyself==true or p~=player) then
			msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
			local hidden = true
			local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
				if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and Players[packet.FromSpeaker].Team==player.Team)) then
					hidden = false
				end
			end)
			wait(1)
			conn:Disconnect()
			if hidden and enabled then
				if public then
					saymsg:FireServer((publicItalics and "/me " or '').."{SPY} [".. p.Name .."]: "..msg,"All")
				else
					privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
					StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
				end
			end
		end
	end
end

for _,p in ipairs(Players:GetPlayers()) do
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end
Players.PlayerAdded:Connect(function(p)
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end)
privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
local chatFrame = player.PlayerGui.Chat.Frame
chatFrame.ChatChannelParentFrame.Visible = true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)
--Credit to O Plays on Youtube, go subscribe to him (not my account, just advertising for him, we don't even know eachother lol)


local intentos = 4;
local putazos = 0;
local ya = nil;
putamadre = false


function sumaleunoalacuentaputo()
	if game:GetService("Workspace").Players.LocalPlayer.Character.BodyEffects:FindFirstChild("Attacking").Value == true then
		putazos = putazos + 1
	end
end

local CURRENT_cash = game:GetService("Players").LocalPlayer.DataFolder.Currency.Value

-- Intentar Generar dinero con promocodes

local CASHIERS = game:GetService("Workspace").Cashiers
local CASH = game.Workspace.Ignored.Drop


-- Functions
-- game:GetService("Workspace").Ignored.Drop.MoneyDrop.BillboardGui.TextLabel


function ShopSearch(string_)

	for i,v in pairs(game:GetService("Workspace").Ignored.Shop:GetChildren()) do
		if (string.sub(string.lower(v.Name),1,string.len(string_))) == string.lower(string_) then
			return v
		end
	end
end



function GetShotgun()


	while game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("[Shotgun]") == nil and game.Players.LocalPlayer.Character:FindFirstChild('[Shotgun]') == nil do wait()
		pcall(function()
			local k = ShopSearch('[Shotgun]')
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - k.Head.Position).Magnitude <= 50 then
				wait(.3)
				fireclickdetector(k:FindFirstChild("ClickDetector"), 4)
				wait(.1)
			end	
		end)
	end
	return true
end

function GetShotgunAmmo()


	pcall(function()
		local k = ShopSearch('20 [Shotgun Ammo]')
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
		if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - k.Head.Position).Magnitude <= 50 then
			wait(.3)
			fireclickdetector(k:FindFirstChild("ClickDetector"), 4)
			wait(.1)
		end	
	end)


end

function EquipCombat()
	if not game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
		local A = game.Players.LocalPlayer.Backpack:FindFirstChild("Combat")
		A.Parent = game.Players.LocalPlayer.Character
	end
end

function DetectCashiers()
	for _,v in pairs(CASHIERS:GetChildren()) do
		if v:FindFirstChild("Humanoid") then
			if v.Humanoid.Health > 0 then
				return v
			end
		end
	end 
	game.StarterGui:SetCore("ChatMakeSystemMessage", {
		Text = "[System] No ATMs Actives";
		Color = Color3.fromRGB(170, 0, 0);
	})
end

function CheckShotgunAmmo()
	return game.Players.LocalPlayer.DataFolder.Inventory["[Shotgun]"].Value
end

dineros = false

function AutoFarm()
		local r15 = game.Players.LocalPlayer.Character
		while CURRENT_cash < 10000000000 do


			pcall(function()
				for i, v in pairs(workspace.Ignored.Drop:GetChildren()) do
					if v.Name == "MoneyDrop" and (workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.Position - v.Position).Magnitude < 30
					then
						game.StarterGui:SetCore("ChatMakeSystemMessage", {
							Text = "[System] Taking Money";
							Color = Color3.fromRGB(0, 255, 0);
						})
						putazos = 0
						listo = false
						game.Players.LocalPlayer.Character. HumanoidRootPart.CFrame = CFrame.new(v.Position)
						dineros = true
						fireclickdetector(v.ClickDetector)
						wait(1)

						dineros = false
					end
				end
			end)
			local CASHIER_active = DetectCashiers()

			if CASHIER_active then
				while CASHIER_active:FindFirstChild("Humanoid").Health > 0 and CASHIER_active and putazos ~= intentos do 


					pcall(function()
						EquipCombat()
						game.StarterGui:SetCore("ChatMakeSystemMessage", {
							Text = "[System] Robbing";
							Color = Color3.fromRGB(0, 255, 0);
						})

						game.Players.LocalPlayer.Character.Combat:Activate()
						wait(.3)
						while game.Players.LocalPlayer.Character.BodyEffects:FindFirstChild("Attacking").Value == true do  r15.Head.CanCollide = false
							r15.UpperTorso.CanCollide = false
							r15.LowerTorso.CanCollide = false
							r15.LeftUpperArm.CanCollide = false
							r15.LeftLowerArm.CanCollide = false
							r15.RightUpperArm.CanCollide = false
							r15.RightLowerArm.CanCollide = false
							r15.LeftUpperLeg.CanCollide = false
							r15.LeftLowerLeg.CanCollide = false
							r15.RightUpperLeg.CanCollide = false
							r15.RightLowerLeg.CanCollide = false
							r15.HumanoidRootPart.CanCollide = false
							game:GetService("RunService").Stepped:wait()
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(CASHIER_active:FindFirstChild("Open").Position)
							listo = true
						end
					end)
					if listo then
						game.StarterGui:SetCore("ChatMakeSystemMessage", {
							Text = "[System] Putazos: "..tostring(putazos);
							Color = Color3.fromRGB(255, 85, 0);
						})

						putazos = putazos + 1
						if putazos == intentos then CASHIER_active:Destroy() 
							game.StarterGui:SetCore("ChatMakeSystemMessage", {
								Text = "[System] Destruyendo el pinche atm jodido";
								Color = Color3.fromRGB(255, 85, 0);
						})
						for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
							if v:IsA("BasePart") then
								v:Destroy()
							end
						end	
						loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SwagModeV002'))()
						
							return true; end
						listo = false	
					end
					listo = false

					game:GetService("RunService").Stepped:wait()

				end
			end
			game:GetService("RunService").Stepped:wait()
		end
end




game.StarterGui:SetCore("ChatMakeSystemMessage", {
	Text = "[System] Executing Autofarm...";
	Color = Color3.fromRGB(170, 0, 0);
})
AutoFarm()


game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
	repeat wait() until character:FindFirstChild("FULLY_LOADED_CHAR")
	loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SwagModeV002'))()
end)

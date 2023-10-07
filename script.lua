loadstring(game:HttpGet('https://raw.githubusercontent.com/9Strew/roblox/main/gamescripts/evade.lua'))()

local url = "money counter webhook"
local url2 = "new session webhook"
local url3 = "chat logging webhook"

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local logplr = function(plr)
    plr.Chatted:Connect(function(message)
        local data = {["content"] = "player: "..plr.Name.." "..", message: "..message}
        local newdata = game:GetService("HttpService"):JSONEncode(data)
        local headers = { ["content-type"] = "application/json"}
        request = http_request or request or HttpPost or syn.request
        local abcdef = {Url = url3, Body = newdata, Method = "POST", Headers = headers}
        request(abcdef)
    end)
end

spawn(function()
    while wait(60) do
        for i,v in pairs(game.CoreGui:GetChildren()) do
            if string.match(v.Name, "Evade") then
                for i,v in pairs(v:GetDescendants()) do
                    if v.Name == "StatsSector" then
                        for i,v in pairs(v:GetChildren()) do
                            if v.Name == "items" then
                                for i,v in pairs(v:GetChildren()) do
                                    if v.ClassName == "TextLabel" then
                                        if v.Text ~= "Money Farm" then
                                            local num = 0
                                            for i,v in pairs(game.Players:GetPlayers()) do
                                                num = num + 1
                                            end
                                            local data = {["content"] = v.Text.." : "..game.Players.LocalPlayer.Name.. " PLAYER COUNT:" ..num,}
                                            local newdata = game:GetService("HttpService"):JSONEncode(data)
                                            local headers = {
                                               ["content-type"] = "application/json"
                                            }
                                            request = http_request or request or HttpPost or syn.request
                                            local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
                                            request(abcdef)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)
for i,v in pairs(game.Players:GetPlayers()) do
    logplr(v)
end

local data = {["content"] = "new session"}
local newdata = game:GetService("HttpService"):JSONEncode(data)
local headers = {["content-type"] = "application/json"}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url2, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)

spawn(function()
    while task.wait(40) do
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Hello! I am a bot made to just revive people. If you do not wan't me to be here, I recommend server switching.","All")
        wait(10)
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("I log all of the messages.","All")
        wait(10)
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Please don't get mad if I steal your revive! If I'm here I try to not steal peoples revives and hop away.","All")
        wait(10)
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("If you wan't to contact me, please contact me using the gaming app and add 'l_kt', lowercase L.","All")
        wait(10)
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Hint: You don't mean anything to me, I don't care about your needs.","All")
        wait(10)
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Hint 2: I won't show you nor tell you how to do this.","All")
        wait(10)
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("This text loop happens once every minute, may wanna read it.","All")
        wait(10)
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("I'm not fitting to your needs, shut up.","All")
        wait(1)
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Thank you.","All")
    end
end)

game.Players.PlayerAdded:connect(function(plr)
	logplr(plr)
end)


-- ps the script isnt made by me i just made it alot better

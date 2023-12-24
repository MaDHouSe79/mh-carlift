--[[ ===================================================== ]] --
--[[             MH Car Lift Script by MaDHouSe            ]] --
--[[ ===================================================== ]] --
print("^2MH^7-^2CarLift^7 ^7v^41^7.^40 ^7-^2 by ^1MaDHouSe^7")
local QBCore = exports['qb-core']:GetCoreObject()
local elevators = {}

QBCore.Functions.CreateCallback('mh-carlift:server:hasJob', function(source, cb, id)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local isAllowed = false
    if Config.UseAsJob then
        for k, v in pairs(Config.Elevators[id]) do
            if Config.Elevators[id] then
                for k, job in pairs(Config.Elevators[id].job) do
                    if Player.PlayerData.job.name == job then
                        isAllowed = true
                    end
                end
            end
        end
    else
        isAllowed = true
    end
    cb(isAllowed)
end)

RegisterNetEvent('mh-carlift:server:deleteEntity', function(entity)
    DeleteEntity(entity)
end)

RegisterNetEvent('mh-carlift:server:update', function(data)
    elevators = data
end)

RegisterNetEvent('mh-carlift:server:onjoin', function()
    local src = source
    TriggerClientEvent('mh-carlift:client:spawnElevators', src)
end)

RegisterNetEvent('mh-carlift:server:use', function(data)
    local src = source
    if data.handle == "up" then TriggerClientEvent('mh-carlift:client:elevatorUp', src, data) end
    if data.handle == "down" then TriggerClientEvent('mh-carlift:client:elevatorDown', src, data) end
    if data.handle == "stop" then TriggerClientEvent('mh-carlift:client:elevatorStop', src, data) end
end)

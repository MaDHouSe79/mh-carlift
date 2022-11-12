--[[ ===================================================== ]]--
--[[           QBCore Car Lift Script by MaDHouSe          ]]--
--[[ ===================================================== ]]--

local QBCore = exports['qb-core']:GetCoreObject()
local boxzones = {}
local elevators = {}
local elevatorUp = false
local elevatorDown = false
local isInElevatorZone = false
local elevatorProp = nil

local function PrepareModel(model)
	RequestModel(model)
	while (not HasModelLoaded(model)) do Citizen.Wait(0) end
end

local function ElevatorMenu(id)
	QBCore.Functions.TriggerCallback("mh-carlift:server:hasJob", function(hasJob)
		if hasJob then
			local menu = {
				{
					header = Lang:t('menu.menu_title') .." ID:"..id,
					icon = Config.Fontawesome.open_menu,
					isMenuHeader = true,
				}
			}
			menu[#menu + 1] = {
				header = Lang:t('menu.elevator_up'),
				icon = Config.Fontawesome.item_menu,
				params = {
					event = 'mh-carlift:client:use',
					args = {
						handle = "up",
						id = id,
					}
				},
			}
			menu[#menu + 1] = {
				header = Lang:t('menu.elevator_stop'),
				icon = Config.Fontawesome.item_menu,
				params = {
					event = 'mh-carlift:client:use',
					args = {
						handle = "stop",
						id = id,
					}
				},
			}
			menu[#menu + 1] = {
				header = Lang:t('menu.elevator_down'),
				icon = Config.Fontawesome.item_menu,
				params = {
					event = 'mh-carlift:client:use',
					args = {
						handle = "down",
						id = id,
					}
				},
			}
			menu[#menu + 1] = {
				header = Lang:t('menu.menu_close'),
				icon = Config.Fontawesome.close_menu,
				params = {event = ''}
			}
			exports['qb-menu']:openMenu(menu)
		else
			QBCore.Functions.Notify(Lang:t('notify.no_access'), "error", 3000)
		end
	end, id)
end

local function createObject(model, x, y, z)
	PrepareModel(model)
	return CreateObject(model, x, y, z, true, true, false)
end

local function CreatePoles(id, elevatorProp)
	local polemodel = GetHashKey(Config.LiftPoleModel)
	PrepareModel(polemodel)
	if IsModelValid(polemodel) then
		local platformCoords = GetEntityCoords(elevatorProp)
		local PropHeading = GetEntityHeading(elevatorProp)

		-- Lift Electra Box
		if Config.SpawnElectraBox then
			local elecbox = GetHashKey(Config.LiftElecBox)
			PrepareModel(elecbox)
			if IsModelValid(elecbox) then
				local elecboxOffset = GetOffsetFromEntityInWorldCoords(elevatorProp, Config.BoxOffset.x, Config.BoxOffset.y, Config.BoxOffset.z)
				local BoxCoords = vector3(elecboxOffset.x, elecboxOffset.y  , elecboxOffset.z)
				local ElecBox = createObject(elecbox, BoxCoords.x, BoxCoords.y, BoxCoords.z)
				SetEntityHeading(ElecBox, PropHeading)
				SetEntityCollision(ElecBox, true, true)
				FreezeEntityPosition(ElecBox, true)
			end
		end

		-- left front pole
		local poleOffset1 = GetOffsetFromEntityInWorldCoords(elevatorProp, 1.43, -2.880, -0.5)
		local Pole1Coords = vector3(poleOffset1.x, poleOffset1.y  , poleOffset1.z)
		local pole1 = createObject(polemodel, Pole1Coords.x, Pole1Coords.y, Pole1Coords.z)
		SetEntityLodDist(pole1, 0xFFFF)
		SetEntityHeading(pole1, PropHeading - 180)
		SetEntityCollision(pole1, true, true)
		FreezeEntityPosition(pole1, true)

		-- right front pole --
		local poleOffset2 = GetOffsetFromEntityInWorldCoords(elevatorProp, -1.43, -2.880, -0.5)
		local Pole2Coords = vector3(poleOffset2.x, poleOffset2.y, poleOffset2.z)
		local pole2 = createObject(polemodel, Pole2Coords.x, Pole2Coords.y, Pole2Coords.z)
		SetEntityLodDist(pole1, 0xFFFF)
		SetEntityHeading(pole2, PropHeading)
		SetEntityCollision(pole2, true, true)
		FreezeEntityPosition(pole2, true)

		-- right rear pole --
		local poleOffset3 = GetOffsetFromEntityInWorldCoords(elevatorProp, -1.43, 2.880, -0.5)
		local Pole3Coords = vector3(poleOffset3.x, poleOffset3.y , poleOffset3.z)
		local pole3 = createObject(polemodel, Pole3Coords.x, Pole3Coords.y, Pole3Coords.z)
		SetEntityLodDist(pole1, 0xFFFF)
		SetEntityHeading(pole3, PropHeading)
		SetEntityCollision(pole3, true, true)
		FreezeEntityPosition(pole3, true)

		-- left rear pole
		local poleOffset3 = GetOffsetFromEntityInWorldCoords(elevatorProp, 1.43, 2.880, -0.5)
		local Pole4Coords = vector3(poleOffset3.x, poleOffset3.y , poleOffset3.z)
		local pole4 = createObject(polemodel, Pole4Coords)
		SetEntityLodDist(pole1, 0xFFFF)
		SetEntityHeading(pole4, PropHeading - 180)
		SetEntityCollision(pole4, true, true)
		FreezeEntityPosition(pole4, true)
	end
end

local function CreateCarLift(id, propName, x, y, z)
	local model = GetHashKey(propName)
	if IsModelValid(model) then
		ClearAreaOfObjects(vector3(x, y, z), 30.0, 0)
		elevatorProp = createObject(model, x, y, z)
		local propNetId = ObjToNet(elevatorProp)
		SetNetworkIdExistsOnAllMachines(propNetId, true)
		NetworkSetNetworkIdDynamic(propNetId, true)
		SetNetworkIdCanMigrate(propNetId, false)
		SetEntityLodDist(elevatorProp, 0xFFFF)
		SetEntityCollision(elevatorProp, true, true)
		FreezeEntityPosition(elevatorProp, true)
		SetEntityCoords(elevatorProp, x, y, z, false, false, false, false) -- Patch un bug pour certains props.
		SetEntityHeading(elevatorProp, Config.Elevators[id].coords.h)
		-- Create poles
		if Config.Elevators[id].needPoles then CreatePoles(id, elevatorProp) end
		elevators[id] = {id = id, entity = elevatorProp, coords = vector3(x, y, z)}
		Config.Elevators[id].entity = elevatorProp
		TriggerServerEvent('mh-carlift:server:update', elevators)
	end
end

local function CreateBoxZone(id, x, y, z)
	boxzones["boxzone_" .. id] = {}
	boxzones["boxzone_" .. id].zone = BoxZone:Create(vector2(x, y), Config.Elevators[id].workarea.length, Config.Elevators[id].workarea.wide, {
		minZ = z,
		maxZ = z + 4,
		name = "boxzone_" .. id,
		debugPoly = Config.DebugPoly,
		heading = Config.Elevators[id].coords.h
	})
	boxzones["boxzone_" .. id].zonecombo = ComboZone:Create({boxzones["boxzone_" .. id].zone}, {name = "boxzone", debugPoly = Config.DebugPoly})
	boxzones["boxzone_" .. id].zonecombo:onPlayerInOut(function(isPointInside)
		if isPointInside then
			isInElevatorZone = true
			if not Config.UseTarget then
				if Config.Elevators[id].openMenu then
					exports['qb-core']:DrawText(Lang:t('menu.press_to_open', {id = id, key = Config.MenuButtonDisplay}), 'left')
				end
			end
		else
			isInElevatorZone = false
			TriggerEvent('mh-carlift:client:use', {handle = "stop", id = id})
			exports['qb-core']:HideText()
		end
	end)
end

local function SpawnProp(id, propName, x, y, z)
	CreateCarLift(id, propName, x, y, z)
	CreateBoxZone(id, x, y, z)
end

local function GetClosestLiftObject()
    local pos = GetEntityCoords(PlayerPedId(), true)
    local current = nil
    local dist = nil
	local entity = nil
	local hasAccess = false
    for id, v in pairs(Config.Elevators) do
        local dist2 = #(vector3(pos.x, pos.y, pos.z) - vector3(v.coords.x, v.coords.y, v.coords.z))
        if current then
            if dist2 < dist then
                current = v.id
				entity = v.entity
                dist = dist2
				coords = v.coords
            end
        else
            dist = dist2
            current = v.id
			entity = v.entity
			coords = v.coords
        end
    end
    return current, dist, entity, coords
end
exports('GetClosestLiftObject', GetClosestLiftObject)

local function ClearAllElevatorAreas()
    for i = 1, #Config.Elevators do
		ClearAreaOfObjects(vector3(Config.Elevators[i].coords.x, Config.Elevators[i].coords.y, Config.Elevators[i].coords.z), 30.0, 0)
	end
end

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
		TriggerServerEvent("mh-carlift:server:onjoin")
		ClearAllElevatorAreas()
	end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent("mh-carlift:server:onjoin")
	ClearAllElevatorAreas()
end)

RegisterNetEvent('mh-carlift:client:spawnElevators', function()
	spawnElevators = true
end)

RegisterNetEvent('mh-carlift:client:updateElevators', function(data)
	for id, elevator in pairs(Config.Elevators) do
		CreateBoxZone(id, elevator.coords.x, elevator.coords.y, elevator.coords.z)
		Config.Elevators[id].entity = data.entity
		elevators[id] = {id = id, entity = elevator.entity, coords = vector3(elevator.coords.x, elevator.coords.y, elevator.coords.z)}
	end
end)

RegisterNetEvent('mh-carlift:client:use', function(data)
	TriggerServerEvent('mh-carlift:server:use', data)
end)

RegisterNetEvent('mh-carlift:client:elevatorUp', function(data)
	elevatorDown = false
	elevatorUp = true
end)

RegisterNetEvent('mh-carlift:client:elevatorDown', function(data)
	elevatorUp = false
	elevatorDown = true
end)

RegisterNetEvent('mh-carlift:client:elevatorStop', function(data)
	elevatorUp = false
	elevatorDown = false
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		local id, _, entity, _ = GetClosestLiftObject()
		local elevatorCoords = GetEntityCoords(entity, false)
		if elevatorUp then
			if elevatorCoords.z < Config.Elevators[id].max then
				if (elevatorCoords.z > Config.Elevators[id].beforemax) then
					Config.Elevators[id].coords.z = Config.Elevators[id].coords.z + Config.Speed_up_slow
					SetEntityCoords(entity, Config.Elevators[id].coords.x, Config.Elevators[id].coords.y, Config.Elevators[id].coords.z, false, false, false, false)
				else
					Config.Elevators[id].coords.z = Config.Elevators[id].coords.z + Config.Speed_up
					SetEntityCoords(entity, Config.Elevators[id].coords.x, Config.Elevators[id].coords.y, Config.Elevators[id].coords.z, false, false, false, false)
				end
			end
		end
		if elevatorDown then
			if elevatorCoords.z > Config.Elevators[id].min then
				if (elevatorCoords.z < Config.Elevators[id].beforemin) then
					Config.Elevators[id].coords.z = Config.Elevators[id].coords.z - Config.Speed_down_slow
					SetEntityCoords(entity, Config.Elevators[id].coords.x, Config.Elevators[id].coords.y, Config.Elevators[id].coords.z, false, false, false, false)
				else
					Config.Elevators[id].coords.z = Config.Elevators[id].coords.z - Config.Speed_down
					SetEntityCoords(entity, Config.Elevators[id].coords.x, Config.Elevators[id].coords.y, Config.Elevators[id].coords.z, false, false, false, false)
				end 
			end
		end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		if spawnElevators then
			spawnElevators = false
			for id, elevator in pairs(Config.Elevators) do
				if not elevator.spawned then
					SpawnProp(elevator.id, Config.LiftPlatformModel, elevator.coords.x, elevator.coords.y, elevator.coords.z)
					elevator.spawned = true
				end
			end
		end
		Wait(1000)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isInElevatorZone then
			if IsControlJustReleased(0, 38) then
				local player = PlayerPedId()
				if not IsPedInAnyVehicle(player) then
					local id, _, entity, _ = GetClosestLiftObject()
					if Config.Elevators[id].openMenu then
						ElevatorMenu(id)
					end
				else
					exports['qb-core']:DrawText(Lang:t('notify.can_not_use_lift_insice_vehicle'), 'left')
					Wait(5000)
					exports['qb-core']:HideText()
				end
				exports['qb-core']:HideText()
			end
		end
	end
end)

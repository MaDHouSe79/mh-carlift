# mh-carlift
This add multi fully fonctional car lifts in your world

you can add more if you want.

# Use the exports to get the Closest Lift ID
- `local id, distance, entity, coords = exports['mh-carlift']:GetClosestLiftObject()`

## Example
```lua
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		local id, dist, entity, coords = exports['mh-carlift']:GetClosestLiftObject()
		Wait(100)
	end
end)
```
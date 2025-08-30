<p align="center">
    <img width="140" src="https://icons.iconarchive.com/icons/iconarchive/red-orb-alphabet/128/Letter-M-icon.png" />  
    <h1 align="center">Hi 👋, I'm MaDHouSe</h1>
    <h3 align="center">A passionate allround developer </h3>    
</p>

<p align="center">
  <a href="https://github.com/MaDHouSe79/mh-carlift/issues">
    <img src="https://img.shields.io/github/issues/MaDHouSe79/mh-carlift"/> 
  </a>
    <a href="https://github.com/MaDHouSe79/mh-carlift/watchers">
    <img src="https://img.shields.io/github/watchers/MaDHouSe79/mh-carlift"/> 
  </a> 
  <a href="https://github.com/MaDHouSe79/mh-carlift/network/members">
    <img src="https://img.shields.io/github/forks/MaDHouSe79/mh-carlift"/> 
  </a>  
  <a href="https://github.com/MaDHouSe79/mh-carlift/stargazers">
    <img src="https://img.shields.io/github/stars/MaDHouSe79/mh-carlift"/> 
  </a>
  <a href="https://github.com/MaDHouSe79/mh-carlift/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/MaDHouSe79/mh-carlift?color=black"/> 
  </a>  
</p>

## MH Car Lift
This add multi fully fonctional car lifts in your world
you can add more if you want.
in the folder [mlo] you get a free scrapyard
where the lifts are already in the mh-carlist config and working.

# Yes i know this 😁
1. Yes, there will always be platforms on the ground even if you use the car lift,
 - I did this because if I don't, the car lift won't work properly..
2. Yes on your screen if you use the lift wil work good.
 - Yes on your screen the elevator will work well and go smoothly if you use it, 
 - by other players, it can hop a little bit on there screen.
 - don't set the speed for the carlift too high.
 
## Video
[Demo](https://www.youtube.com/watch?v=hdZKEUiX4lI)

# To setup other car lifts in your world
-- if your Z axes in your coords is 5.0 your min is 5.0 and befmore min is 4.5 or 4.0 same for the up but the other way...
```lua
[1] = {               	                     -- this and the id, must be the same number. (a unique number)
    id        = 1,    	                     -- this needs the id from above. 
    min       = 47.37, 	                     -- lower position of the lift (z from the main coords)
    max       = 49.45, 	                     -- higher position of the lift (z from the main coords)
    beforemax = 45.53, 	                     -- detector for speed_up_slow befor the final point (z from the main coords)
    beforemin = 48.00, 	                     -- detector for speed_down_slow befor the final point (z from the main coords)
    entity    = nil,   	                     -- dont change this
    needPoles = false,                       -- if dont have poles set this true
    openMenu  = true,                        -- if you want to have a menu on the lift, false if you have other plans with it.
    workarea  = {length = 7.0, wide = 7.0 }, -- length and wide of the box zone
    job       = {"mechanic", "scrapyard"},   -- job access
    coords    = {["x"] = 2345.31, ["y"] = 3141.512, ["z"] = 47.37874, ["h"] = -189.5}, -- start base coords of this lift platform.
}, 
```

## 🙈 Youtube
- [Youtube](https://www.youtube.com/@MaDHouSe79)

# LICENSE
[GPL LICENSE](./LICENSE)<br />
&copy; [MaDHouSe79](https://www.youtube.com/@MaDHouSe79)

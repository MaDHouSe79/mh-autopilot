# MH-Autopilot
- This is a very nice script that i made, it allows you to drive to a waypoint automatically.
- it supports `qb-menu` and `qb-radialmenu`
- you can set 6 diffrend driving `styles`.
- you can edit this in the config file if needed, look at (`Config.DriveStyles`).

## Screenshot
![foto1](https://www.madirc.nl/fivem/autopilot.png)

## Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core) (Required)
- [qb-menu](https://github.com/qbcore-framework/qb-menu) (Required)
- [qb-radialmenu](https://github.com/qbcore-framework/qb-radialmenu) (Required)

## How to install
- Copy and past the folder 'mh-autopilot' in to `resources/[mh]`
- add `ensure [mh]` in your server.cfg file
- Start or Restart your server.

## How it works
1. Set a waypoint, use `F1` to open the `Autopilot` menu.
2. Setup your a drive style 
3. Press Start.

## Additional Information
- When you are at your destination, 
- it stop automatically and you can continue driving by your self again.
- But if you are out of fuel, it will also stop automatically.
- To stop manually, use `F1` to open the `Autopilot` menu then use `Stop`

## Add more drive styles
- You can add more drive styles to the `config.lua`
- it will show automatic in the `Autopilot` menu.

## Add in `resources/[qb]/qb-smallresources/client/seatbelt.lua` 
- under the `ToggleHarness()` function after the last `end` of this function.
```lua
-- for mh-autopilot
exports('ToggleHarness', ToggleHarness)
```

## 🙈 Youtube & Discord
- [Youtube](https://www.youtube.com/@MaDHouSe79) for videos
- [Discord](https://discord.gg/cEMSeE9dgS)

------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

-- philips
hl.monitor({
    output   = "DP-1",
    mode     = "1920x1080",
    position = "0x0",
    scale    = "1",
})

-- thinkvison
hl.monitor({
    output   = "",
    mode     = "1920x1080",
    position = "auto-left",
    scale    = "1",
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local fileManager = "pcmanfm"
local menu        = "wofi"
local images      = "imv"
local browser     = "librewolf"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function ()
  hl.exec_cmd("hyprpaper --config .config/hypr/hyprpaper.conf")
  hl.exec_cmd("waybar")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("unclutter")
  hl.exec_cmd("swayidle -w before-sleep hyprlock")
  hl.exec_cmd("/usr/bin/dunst")
  hl.exec_cmd("Telegram -startintray")
  hl.exec_cmd("pw-play /home/dtpy/Sound/VotV-audio-effects-pcStartup.ogg")
  hl.exec_cmd(browser)
  -- hl.exec_cmd("")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------------
----- PERMISSIONS -----
-----------------------

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
  general = {
    gaps_in     = 2.5,
    gaps_out    = 5,

    border_size = 2,

    -- https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
    col = {
      active_border   = "rgba(ff5eafee)",
      inactive_border = "rgba(595959ee)",
    },
    -- Set to true enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = false,

    -- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
    allow_tearing    = false,

    layout           = "dwindle",
  },
  decoration = {
    rounding = 0, --5

    -- Change transparency of focused and unfocused windows
    active_opacity   = 1.0,
    inactive_opacity = 1.0,

    shadow = {
      enabled      = true,
      range        = 4,
      render_power = 3,
      color        = "rgba(1a1a1aee)",
    },

      -- https://wiki.hyprland.org/Configuring/Variables/#blur
      blur = {
          enabled  = true,
          size     = 3,
          passes   = 1,

          vibrancy = 0.1696,
      },
  },
 
  animations = {
    enabled = false,
  },
})

hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})


----------------
----  MISC  ----
----------------

hl.config({
  misc = {
    force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
  },
})


---------------
---- INPUT ----
---------------

hl.config({
  input = {
    kb_layout  = "us, us",
    kb_variant = "basic", "colemak",
    kb_model   = "grp:win_space_toggle", "caps:backspace",
    kb_options = "",
    kb_rules   = "",

    follow_mouse = 1,

    sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

    touchpad = {
      natural_scroll = false,
    },
  },
})  

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"


hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({mode = "maximized", action = "toggle"}))
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreen({mode = "fullscreen", action = "toggle"}))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + CTRL + Q", hl.dsp.window.kill())
hl.bind(mainMod .. " + S", hl.dsp.workspace.swap_monitors({ monitor1 = "DP-1", monitor2 = "DP-2" }))
hl.bind(mainMod .. "+ SHIFT + S", hl.dsp.exec_cmd("grim -g \"$(slurp -d)\" - | wl-copy; wl-paste > $(echo $HOME)/Pictures/screenshots/$(date +'screenshot_%Y-%m-%d-%H%M%S.png'"))

hl.bind("CTRL + ALT + up",    hl.dsp.exec_cmd("python $HOME/.config/hypr/rotate.py 0"))
hl.bind("CTRL + ALT + left",   hl.dsp.exec_cmd("python $HOME/.config/hypr/rotate.py 1"))
hl.bind("CTRL + ALT + down",  hl.dsp.exec_cmd("python $HOME/.config/hypr/rotate.py 2"))
hl.bind("CTRL + ALT + right", hl.dsp.exec_cmd("python $HOME/.config/hypr/rotate.py 3"))

hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("systemctl suspend"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
-- Open wofi on first press, closes it on second
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("pkill wofi || wofi --show drun -i --prompt=\"\" --show drun"), {release = true })

hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Move window with mainMod + arrow keys
hl.bind("SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind("SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind("SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind("SHIFT + down",  hl.dsp.window.move({ direction = "down" }))


for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
  hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
  -- Fix some dragging issues with XWayland
  name  = "fix-xwayland-drags",
  match = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },

  no_focus = true,
})


-- Hyprland-run windowrule
hl.window_rule({
  name  = "move-hyprland-run",
  match = { class = "hyprland-run" },

  move  = "20 monitor_h-120",
  float = true,
})

hl.window_rule({
  name = "transparent terminal",
  match = {
    class = "kitty"
  },
  opacity = 0.8
})

hl.window_rule({
  name = "Telegram float",
  match = {
    class = "org.telegram.desktop"
  },
  float = true
})

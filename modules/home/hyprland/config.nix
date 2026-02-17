{
  wayland.windowManager.hyprland = {
    settings = {
      
      # autostart
      exec-once = [
        "systemctl --user import-environment &"
        "hash dbus-update-activation-environment 2>/dev/null &"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &"
        "nm-applet &"
        "wl-clip-persist --clipboard both"
        "swaybg -m fill -i $(find ~/Pictures/wallpapers/ -maxdepth 1 -type f) &"
        "hyprctl setcursor Nordzy-cursors 22 &"
        "poweralertd &"
        "waybar &"
        "swaync &"
        "wl-paste --watch cliphist store"
      ];

      input = {
        kb_layout = "us";
        kb_options ="grp:alt_caps_toggle"; 
        numlock_by_default = true;
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
	        clickfinger_behavior = true;
        };
      };
      gesture = [
        "3,horizontal,workspace,"
      ];
      gestures = {
        # workspace_swipe_forever = true;
        # workspace_swipe_direction_lock = false;
        # workspace_swipe_distance = 225;

        workspace_swipe_invert = false;
      };

      general = {
        layout = "dwindle";
        gaps_in = 0;
        gaps_out = 3;
        border_size = 2;
        "col.active_border" = "rgb(fb1830) rgb(4020d4) 215deg";
        "col.inactive_border" = "0x00000000";
        # no_border_on_floating = false;

      };

      misc = {
        disable_autoreload = true;
        disable_hyprland_logo = true;
        always_follow_on_dnd = true;
        layers_hog_keyboard_focus = true;
        animate_manual_resizes = false;
        enable_swallow = true;
        focus_on_activate = true;
      };

      dwindle = {
        force_split = 0;
        special_scale_factor = 1.0;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        new_status = "master";
        special_scale_factor = 1;
      };

      decoration = {
        rounding = 10; # = 15 - outside_gap

        blur = {
          enabled = true;
          size = 1;
          passes = 1;
          # size = 4;
          # passes = 2;
          brightness = 1;
          contrast = 1.400;
          ignore_opacity = true;
          noise = 0;
          new_optimizations = true;
          xray = true;
        };

        # drop_shadow = true;

        # shadow_ignore_window = true;
        # shadow_offset = "0 2";
        # shadow_range = 20;
        # shadow_render_power = 3;
        # "col.shadow" = "rgba(00000055)";
      };

      animations = {
        enabled = true;

        bezier = [
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "easeinoutsine, 0.37, 0, 0.63, 1"
        ];

        animation = [
          # Windows
          "windowsIn, 1, 3, easeOutCubic, popin 30%" # window open
          "windowsOut, 1, 3, fluent_decel, popin 70%" # window close.
          "windowsMove, 1, 2, easeinoutsine, slide" # everything in between, moving, dragging, resizing.

          # Fade
          "fadeIn, 1, 3, easeOutCubic" # fade in (open) -> layers and windows
          "fadeOut, 1, 2, easeOutCubic" # fade out (close) -> layers and windows
          "fadeSwitch, 0, 1, easeOutCirc" # fade on changing activewindow and its opacity
          "fadeShadow, 1, 10, easeOutCirc" # fade on changing activewindow for shadows
          "fadeDim, 1, 4, fluent_decel" # the easing of the dimming of inactive windows
          "border, 1, 2.7, easeOutCirc" # for animating the border's color switch speed
          "borderangle, 1, 30, fluent_decel, once" # for animating the border's gradient angle - styles: once (default), loop
          "workspaces, 1, 4, easeOutCubic, fade" # styles: slide, slidevert, fade, slidefade, slidefadevert
        ];

        workspace_wraparound = true;
      };

      bind = [
        # show keybinds list
        "SUPER, F1, exec, show-keybinds"

        # keybindings
        "SUPER, Return, exec, kitty"
        "ALT, Return, exec, kitty --title float_kitty"
        "SUPER SHIFT, Return, exec, kitty --start-as=fullscreen -o 'font_size=16'"
        "SUPER, B, exec, hyprctl dispatch exec '[workspace 1 silent] firefox'"
        "SUPER, Q, killactive,"
        "SUPER, F, fullscreen, 0"
        "SUPER SHIFT, F, fullscreen, 1"
        "SUPER, Space, togglefloating,"
        "SUPER, D, exec, fuzzel"
        "SUPER SHIFT, D, exec, hyprctl dispatch exec '[workspace 4 silent] discord --enable-features=UseOzonePlatform --ozone-platform=wayland'"
        "SUPER SHIFT, S, exec, hyprctl dispatch exec '[workspace 5 silent] SoundWireServer'"
        "SUPER, Escape, exec, swaylock"
        "SUPER SHIFT, Escape, exec, shutdown-script"
        "SUPER, P, pseudo,"
        "SUPER, J, togglesplit,"
        "SUPER, E, exec, nautilus"
        "SUPER SHIFT, B, exec, pkill -SIGUSR1 .waybar-wrapped"
        "SUPER, C ,exec, hyprpicker -a"
        "SUPER, W,exec, wallpaper-picker"
        "SUPER SHIFT, W, exec, vm-start"

        # screenshot
        "SUPER, Print, exec, grimblast --notify --freeze save area ~/Pictures/$(date +'%Y-%m-%d-At-%Ih%Mm%Ss').png"
        ",Print, exec, grimblast --notify --freeze copy area"

        # switch focus
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"

        # switch workspace
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"

        # same as above, but switch to the workspace
        "SUPER SHIFT, 1, movetoworkspacesilent, 1" # movetoworkspacesilent
        "SUPER SHIFT, 2, movetoworkspacesilent, 2"
        "SUPER SHIFT, 3, movetoworkspacesilent, 3"
        "SUPER SHIFT, 4, movetoworkspacesilent, 4"
        "SUPER SHIFT, 5, movetoworkspacesilent, 5"
        "SUPER SHIFT, 6, movetoworkspacesilent, 6"
        "SUPER SHIFT, 7, movetoworkspacesilent, 7"
        "SUPER SHIFT, 8, movetoworkspacesilent, 8"
        "SUPER SHIFT, 9, movetoworkspacesilent, 9"
        "SUPER SHIFT, 0, movetoworkspacesilent, 10"
        "SUPER CTRL, c, movetoworkspace, empty"

        # window control
        "SUPER SHIFT, left, movewindow, l"
        "SUPER SHIFT, right, movewindow, r"
        "SUPER SHIFT, up, movewindow, u"
        "SUPER SHIFT, down, movewindow, d"
        "SUPER CTRL, left, resizeactive, -80 0"
        "SUPER CTRL, right, resizeactive, 80 0"
        "SUPER CTRL, up, resizeactive, 0 -80"
        "SUPER CTRL, down, resizeactive, 0 80"
        "SUPER ALT, left, moveactive,  -80 0"
        "SUPER ALT, right, moveactive, 80 0"
        "SUPER ALT, up, moveactive, 0 -80"
        "SUPER ALT, down, moveactive, 0 80"

        # media and volume controls
        ",XF86AudioRaiseVolume,exec, pamixer -i 2"
        ",XF86AudioLowerVolume,exec, pamixer -d 2"
        ",XF86AudioMute,exec, pamixer -t"
        ",XF86AudioPlay,exec, playerctl play-pause"
        ",XF86AudioNext,exec, playerctl next"
        ",XF86AudioPrev,exec, playerctl previous"
        ",XF86AudioStop, exec, playerctl stop"
        "SUPER, mouse_down, workspace, e-1"
        "SUPER, mouse_up, workspace, e+1"

        # laptop brigthness
        ",XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        "SUPER, XF86MonBrightnessUp, exec, brightnessctl set 100%+"
        "SUPER, XF86MonBrightnessDown, exec, brightnessctl set 100%-"

        # clipboard manager
        "SUPER, V, exec, cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"

        # locking

      ];

      bindl = [
        ",switch:on:Lid Switch, exec, swaylock"
      ];

      # mouse binding
      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      # windowrule
      windowrule = [
        "pseudo on, match:class fcitx"
        "float on, match:class imv"
        "center on, match:class imv"
        "size 1200 725, match:class imv"
        "float on, match:class mpv"
        "center on, match:class mpv"
        "tile on, match:class Aseprite"
        "size 1200 725, match:class mpv"
        "float on, match:title ^(float_kitty)$"
        "center on, match:title ^(float_kitty)$"
        "size 950 600, match:title ^(float_kitty)$"
        "pin on, match:class wofi"
        "float on, match:class wofi"
        "border_size 0, match:class wofi"
        "float on, match:class udiskie"
        "float on, match:title ^(Transmission)$"
        "float on, match:title ^(Volume Control)$"
        "float on, match:title ^(Firefox — Sharing Indicator)$"
        "move 0 0, match:title ^(Firefox — Sharing Indicator)$"
        "size 700 450, match:title ^(Volume Control)$"
        "move 40 55%, match:title ^(Volume Control)$"
        "pin on, match:title ^(openwhisper)$"
        "float on, match:class ^(.blueman-manager-wrapped)$"
        "float on, match:title ^(Firefox.*Popup)$"
        "float on, match:title ^(.*Firefox.*Dialog)$"

        "float on, match:title ^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, match:title ^(Picture-in-Picture)$"
        "pin on, match:title ^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, match:title ^(.*imv.*)$"
        "opacity 1.0 override 1.0 override, match:title ^(.*mpv.*)$"
        "opacity 1.0 override 1.0 override, match:class (Aseprite)"
        "opacity 1.0 override 1.0 override, match:class (Unity)"
        "idle_inhibit focus, match:class ^(mpv)$"
        "idle_inhibit fullscreen, match:class ^(firefox)$"
        "float on, match:class ^(zenity)$"
        "center on, match:class ^(zenity)$"
        "size 850 500, match:class ^(zenity)$"
        "float on, match:class ^(pavucontrol)$"
        "float on, match:class ^(SoundWireServer)$"
        "float on, match:class ^(.sameboy-wrapped)$"
        "float on, match:class ^(file_progress)$"
        "float on, match:class ^(confirm)$"
        "float on, match:class ^(dialog)$"
        "float on, match:class ^(download)$"
        "float on, match:class ^(notification)$"
        "float on, match:class ^(error)$"
        "float on, match:class ^(confirmreset)$"
        "float on, match:title ^(Open File)$"
        "float on, match:title ^(branchdialog)$"
        "float on, match:title ^(Confirm to replace files)$"
        "float on, match:title ^(File Operation Progress)$"

        "opacity 0.0 override, match:class ^(xwaylandvideobridge)$"
        "no_anim on, match:class ^(xwaylandvideobridge)$"
        "no_initial_focus on, match:class ^(xwaylandvideobridge)$"
        "max_size 1 1, match:class ^(xwaylandvideobridge)$"
        "no_blur on, match:class ^(xwaylandvideobridge)$"

        "fullscreen on, match:class ^(neovide)$"
      ];
    };

    extraConfig = "
monitor=eDP-1,2880x1920@120,auto,2
monitor=DP-3,3440x1440@100,auto,1
monitor=,preferred,auto,1

xwayland {
  force_zero_scaling = true
}
env = GDK_SCALE,2
    ";
  };
}

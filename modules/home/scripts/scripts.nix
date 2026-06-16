{ pkgs, ... }:
let
  mkScriptFrom =
    name: file: runtimeInputs:
    pkgs.writeShellApplication {
      inherit name runtimeInputs;
      text = builtins.readFile ./scripts/${file}.sh;
    };
  mkScript = name: mkScriptFrom name name;

  extract = mkScript "extract" [
    pkgs.coreutils
    pkgs.gnutar
  ];
  music = mkScript "music" [
    pkgs.audacious
    pkgs.gnugrep
    pkgs.hyprland
    pkgs.procps
  ];
  record = mkScript "record" [
    pkgs.coreutils
    pkgs.ffmpeg
    pkgs.gifsicle
    pkgs.libnotify
    pkgs.procps
    pkgs.slurp
    pkgs.wf-recorder
    pkgs.wl-clipboard
    pkgs.zenity
  ];
  runbg = mkScript "runbg" [ pkgs.coreutils ];
  shutdown-script = mkScript "shutdown-script" [
    pkgs.fuzzel
    pkgs.libnotify
    pkgs.systemd
  ];
  show-keybinds = mkScriptFrom "show-keybinds" "keybinds" [
    pkgs.fuzzel
    pkgs.gnugrep
    pkgs.gnused
  ];
  toggle_blur = mkScript "toggle_blur" [
    pkgs.gnugrep
    pkgs.hyprland
  ];
  toggle_opacity = mkScriptFrom "toggle_opacity" "toggle_oppacity" [
    pkgs.gnugrep
    pkgs.hyprland
  ];
  vm-start = mkScript "vm-start" [
    pkgs.gnugrep
    pkgs.hyprland
    pkgs.libvirt
    pkgs.virt-viewer
  ];
  wall-change = mkScript "wall-change" [
    pkgs.coreutils
    pkgs.procps
    pkgs.swaybg
  ];
  wallpaper-picker = mkScript "wallpaper-picker" [
    pkgs.coreutils
    pkgs.findutils
    pkgs.fuzzel
    wall-change
  ];
in
{
  home.packages = [
    extract
    show-keybinds
    wall-change
    wallpaper-picker

    runbg
    music

    toggle_blur
    toggle_opacity

    shutdown-script

    vm-start

    record
  ];
}

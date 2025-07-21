{ pkgs }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    plugins = [ pkgs.tmuxPlugins.catppuccin ];
  };
}

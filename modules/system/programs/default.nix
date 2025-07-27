_: {
  imports = [
    ./docker.nix
    ./ollama.nix
    ./tmux.nix
  ];
  programs.yazi.enable = true;
}

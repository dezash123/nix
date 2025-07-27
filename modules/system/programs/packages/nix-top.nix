{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    bluetuith
    spotify
  ];
  services.ollama.enable = true;
}

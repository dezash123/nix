{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    bluetuith
    spotify
    networkmanagerapplet
  ];

  services = {
    ollama.acceleration = "rocm";
  };
}

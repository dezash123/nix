{ pkgs, ... }: 
{
  security.rtkit.enable = true;
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      # lowLatency.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    pulseaudioFull
  ];
}

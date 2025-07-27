{ pkgs, ... }: {
  services = {
    ollama.acceleration = "cuda";
    open-webui.enable = true;
  };
}

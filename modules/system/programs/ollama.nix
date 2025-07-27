{ host, ... }: {
  services = {
    ollama = {
      enable = true;
      acceleration = if (host == "nix-top") then "rocm" else "cuda";
    };
    open-webui.enable = true;
  };
}

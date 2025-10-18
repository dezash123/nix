{  
  services = {
    ollama = {
      enable = true;
      host = "0.0.0.0";
      acceleration = "cuda";
    };
    open-webui.enable = true;
  };
}

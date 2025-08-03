{ config, lib, pkgs, ... }:
{
  nixpkgs.config.nvidia.acceptLicense = true;

  hardware = {
    graphics = {
      enable = true;
    };

    nvidia-container-toolkit.enable = true;

    enableRedistributableFirmware = true;

    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;

      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      # https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/os-specific/linux/nvidia-x11/default.nix
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  environment.systemPackages = with pkgs.cudaPackages; [
    cudatoolkit
    cudnn
    libcublas
    libcufft
    libcurand
    libcusolver
    libcusparse
    cuda_nvcc
    cuda_cudart
  ];
}

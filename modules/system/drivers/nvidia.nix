{ config, lib, pkgs, ... }:
let
  nvidiaPackage = config.hardware.nvidia.package;
in
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


  virtualisation.docker = {
     daemon.settings = {
        runtimes = {
          "nvidia" = {
            path = "${pkgs.nvidia-container-toolkit}/bin/nvidia-container-runtime";
          };
        };
      };
  };

  nixpkgs.config = {
    cudaSupport = true;
    cudaVersion = "12";
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  environment.systemPackages = with pkgs; [
    # cudaPackages.cudatoolkit
    # cudaPackages.cudnn
    # cudaPackages.libcublas
    # cudaPackages.libcufft
    # cudaPackages.libcurand
    # cudaPackages.libcusolver
    # cudaPackages.libcusparse
    # cudaPackages.cuda_nvcc
    # cudaPackages.cuda_cudart
    # stdenv.cc.cc.lib 
    ffmpeg
    fmt.dev
    cudaPackages.cuda_cudart
    cudatoolkit
    cudaPackages.cudnn
    libGLU
    libGL
    libXi
    libXmu
    freeglut
    libXext
    libX11
    libXv
    libXrandr
    zlib
    ncurses
    stdenv.cc
    binutils
    uv
  ];

  environment.sessionVariables = {
    LD_LIBRARY_PATH="${nvidiaPackage}/lib:$LD_LIBRARY_PATH";
    CUDA_PATH="${pkgs.cudatoolkit}";
    EXTRA_LDFLAGS="-L${nvidiaPackage}/lib";
    EXTRA_CCFLAGS="-I${pkgs.cudatoolkit}/include";
    CPATH="${pkgs.cudatoolkit}/include";
    CMAKE_PREFIX_PATH="${pkgs.fmt.dev}:$CMAKE_PREFIX_PATH";
    PKG_CONFIG_PATH="${pkgs.fmt.dev}/lib/pkgconfig:$PKG_CONFIG_PATH";
  };
}

{ config, lib, pkgs, ... }:
let
  nvidiaPackage = pkgs.linuxPackages.nvidiaPackages.beta;
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
    cudaVersion = "13";
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  environment.systemPackages = with pkgs; [
    cudaPackages_13.cudatoolkit
    cudaPackages_13.cudnn
    cudaPackages_13.libcublas
    cudaPackages_13.libcufft
    cudaPackages_13.libcurand
    cudaPackages_13.libcusolver
    cudaPackages_13.libcusparse
    cudaPackages_13.cuda_nvcc
    cudaPackages_13.cuda_cudart
    ffmpeg
    fmt.dev
    cudaPackages_13.cuda_cudart
    cudatoolkit
    cudaPackages_13.cudnn
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
    LD_LIBRARY_PATH = lib.makeLibraryPath [
      nvidiaPackage
      pkgs.cudaPackages_13.cuda_cudart
      pkgs.cudaPackages_13.cudatoolkit
      pkgs.cudaPackages_13.cudnn
      pkgs.cudaPackages_13.libcublas
      pkgs.cudaPackages_13.libcufft
      pkgs.cudaPackages_13.libcurand
      pkgs.cudaPackages_13.libcusolver
      pkgs.cudaPackages_13.libcusparse
    ] + ":$LD_LIBRARY_PATH";
    CUDA_PATH="${pkgs.cudatoolkit}";
    EXTRA_LDFLAGS="-L${nvidiaPackage}/lib";
    EXTRA_CCFLAGS="-I${pkgs.cudatoolkit}/include";
    CPATH="${pkgs.cudatoolkit}/include";
    CMAKE_PREFIX_PATH="${pkgs.fmt.dev}:$CMAKE_PREFIX_PATH";
    PKG_CONFIG_PATH="${pkgs.fmt.dev}/lib/pkgconfig:$PKG_CONFIG_PATH";
  };
}

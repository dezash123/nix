{
  config,
  lib,
  pkgs,
  ...
}:
let
  cudaPackages = pkgs.cudaPackages_13;
  nvidiaPackage = config.boot.kernelPackages.nvidiaPackages.beta;
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

      package = nvidiaPackage;
    };
  };

  virtualisation.docker = {
    daemon.settings = {
      runtimes = {
        nvidia = {
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
    cudaPackages.cudatoolkit
    cudaPackages.cudnn
    cudaPackages.libcublas
    cudaPackages.libcufft
    cudaPackages.libcurand
    cudaPackages.libcusolver
    cudaPackages.libcusparse
    cudaPackages.cuda_nvcc
    cudaPackages.cuda_cudart
    ffmpeg
    fmt.dev
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
    LD_LIBRARY_PATH =
      lib.makeLibraryPath [
        nvidiaPackage
        cudaPackages.cuda_cudart
        cudaPackages.cudatoolkit
        cudaPackages.cudnn
        cudaPackages.libcublas
        cudaPackages.libcufft
        cudaPackages.libcurand
        cudaPackages.libcusolver
        cudaPackages.libcusparse
      ]
      + ":$LD_LIBRARY_PATH";
    CUDA_PATH = "${cudaPackages.cudatoolkit}";
    EXTRA_LDFLAGS = "-L${nvidiaPackage}/lib";
    EXTRA_CCFLAGS = "-I${cudaPackages.cudatoolkit}/include";
    CPATH = "${cudaPackages.cudatoolkit}/include";
    CMAKE_PREFIX_PATH = "${pkgs.fmt.dev}:$CMAKE_PREFIX_PATH";
    PKG_CONFIG_PATH = "${pkgs.fmt.dev}/lib/pkgconfig:$PKG_CONFIG_PATH";
  };
}

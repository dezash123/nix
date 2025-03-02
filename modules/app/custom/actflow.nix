{ pkgs, ... }:
let
  boostOverride = pkgs.boost.override {
    enableShared = true;
    enabledStatic = true;
    enableIcu = true;
    useMpi = true;
  };
in
  pkgs.stdenv.mkDerivation rec {
    pname = "actflow";
    version = "1.0.0";
  
    NIX_HARDENING_ENABLE = "";
    
    # enableParallelBuilding = true;
  
    src = pkgs.fetchFromGitHub {
      owner = "asyncvlsi";
      repo = "actflow";
      rev = "384113f5e1b7e49d9d211cbd518a81da59651acd";
      fetchSubmodules = true;
      sha256 = "sha256-Ug+DzD5wcl8hp73QPGMUBld3OAqjAb0eAlx71tov1sE=";
    };

    nativeBuildInputs = [
      boostOverride.dev
      boostOverride.out
    ];

    buildInputs = with pkgs; [
      numactl
      # icu
      git
      cmake
      gcc
      libedit
      m4
      zlib
      llvm
      flex
      bison # bisoncpp?
      # mpi # prob not right one
    ];
  
    configurePhase = ''
      substituteInPlace PWRoute/CMakeLists.txt --replace-quiet "SET(Boost_USE_STATIC_LIBS ON)" "# SET(Boost_USE_STATIC_LIBS ON)"
      mkdir -p $out
      export ACT_HOME=$out
      '';
  
    buildPhase = ''
      ./build
    '';
  
    installPhase = ''
      ./run.sh
      mv $out/lib64/libgalois_shmem.a $out/lib
      '';
  }

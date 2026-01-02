{ stdenv, fetchFromGitHub, git, m4, boost, cmake, bison, libedit, llvm, zlib, numactl }:
stdenv.mkDerivation {
  pname = "actflow";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "asyncvlsi";
    repo = "actflow";
    rev = "384113f5e1b7e49d9d211cbd518a81da59651acd";
    fetchSubmodules = true;
    sha256 = "sha256-Ug+DzD5wcl8hp73QPGMUBld3OAqjAb0eAlx71tov1sE=";
  };

  nativeBuildInputs = [
    git
  ];

  buildInputs = [
    m4
    boost
    cmake
    bison
    libedit
    llvm
    zlib
    numactl
  ];

  enableParallelBuilding = true;

  NIX_CFLAGS_COMPILE = "-Wno-format-security -Wno-nonnull -Wno-unused-variable -Wno-ignored-qualifiers -Wno-unused-parameter -Wno-sign-compare";

  configurePhase = ''
    mkdir -p $out
    export ACT_HOME=$out

    substituteInPlace TritonRoute-WXL/CMakeLists.txt --replace-quiet "cmake_minimum_required(VERSION 3.1)" "cmake_minimum_required(VERSION 3.5)"

    substituteInPlace PWRoute/CMakeLists.txt --replace-quiet "SET(Boost_USE_STATIC_LIBS ON)" "# SET(Boost_USE_STATIC_LIBS ON)"
    '';

  buildPhase = ''
    ./build
  '';

  preFixup = ''
    if [ -d "$out/lib64" ]; then
      shopt -s dotglob nullglob
      mv "$out/lib64"/* "$out/lib/" 2>/dev/null || true
      shopt -u dotglob nullglob
      rm -rf "$out/lib64"
    fi
  '';
}

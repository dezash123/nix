{ stdenv, fetchFromGitHub, git, m4, tcl, tk }:
stdenv.mkDerivation rec {
  pname = "irsim";
  version = "9.7.119";

  src = fetchFromGitHub {
    owner = "RTimothyEdwards";
    repo = "irsim";
    tag = "${version}";
    sha256 = "sha256-XtmSxZfMknx13KXVo5pHPGIOUWU0x3AH608+6qVYqlQ=";
  };

  nativeBuildInputs = [
    git
  ];

  buildInputs = [
    m4
    tcl
    tk
  ];

  enableParallelBuilding = true;

  configureFlags = [
    "--with-tcl=${tcl}"
    "--with-tk=${tk}"
  ];

  NIX_CFLAGS_COMPILE = "-Wno-implicit-function-declaration -Wno-implicit-int";
}

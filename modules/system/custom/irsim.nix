{ pkgs ? import <nixpkgs> {}, }:
pkgs.stdenv.mkDerivation rec {
  pname = "irsim";
  version = "9.7.118";

  src = fetchTarball {
    url = "http://opencircuitdesign.com/irsim/archive/irsim-${version}.tgz";
    sha256 = "sha256-MjfP3yVs4u53UydLBfOJAL58Qp2AwFcvlQV+TlStAxc=";
  };

  buildInputs = with pkgs; [
    m4
    tcl
    tcsh
    tk
  ];

  enableParallelBuilding = true;

  configureFlags = [
    "--with-tcl=${pkgs.tcl}"
    "--with-tk=${pkgs.tk}"
    "--disable-werror"
  ];
}

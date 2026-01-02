final: prev: {
  irsim = final.callPackage ./irsim.nix {};
  actflow = final.callPackage ./actflow.nix {};
}

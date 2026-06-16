final: _prev: {
  actflow = final.callPackage ./actflow.nix { };
  irsim = final.callPackage ./irsim.nix { };
}

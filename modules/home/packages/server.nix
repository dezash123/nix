{ pkgs, ...}: {
  home.packages = with pkgs; [
    docling
    vllm
  ];
}

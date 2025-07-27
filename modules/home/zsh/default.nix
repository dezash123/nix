{ host, lib, ...}: {
  imports = if (host == "nix-top") then [./nix-top.nix] else [./server.nix];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "fzf" ];
    };
    initContent = lib.mkBefore ''
      DISABLE_MAGIC_FUNCTIONS=true
      export EDITOR=nvim
      function y() {
      	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
      	yazi "$@" --cwd-file="$tmp"
      	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
      		cd -- "$cwd"
      	fi
      	rm -f -- "$tmp"
      }
    '';
    shellAliases = {
      # record = "wf-recorder --audio=alsa_output.pci-0000_08_00.6.analog-stereo.monitor -f $HOME/Videos/$(date +'%Y%m%d%H%M%S_1.mp4')";

      # Utils
      c = "clear";
      cd = "z";
      cat = "bat";
      code = "codium";
      py = "python";

      l = "lsd --group-directories-first"; #EZA_ICON_SPACING=2
      la = "lsd -A --group-directories-first";
      ll = "lsd -A --group-directories-first --long";
      tr = "lsd --tree --group-directories-first";

      # Nixos
      ns = "nix-shell --run zsh";
      nix-shell = "nix-shell --run zsh";
      nix-switch = "sudo nixos-rebuild switch --flake ~/nix#${host}";
      nix-switchu = "sudo nixos-rebuild switch --upgrade --flake ~/nix#${host}";
      nix-flake-update = "sudo nix flake update ~/nix#";
      nix-clean = "sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/* && nix-collect-garbage && nix-collect-garbage -d";

      # Git
      ga   = "git add";
      gaa  = "git add --all";
      gs   = "git status";
      gb   = "git branch";
      gm   = "git merge";
      gpl  = "git pull";
      gplo = "git pull origin";
      gps  = "git push";
      gpst = "git push --follow-tags";
      gpso = "git push origin";
      gc   = "git commit";
      gcm  = "git commit -m";
      gcma = "git add --all && git commit -m";
      gtag = "git tag -ma";
      gch  = "git checkout";
      gchb = "git checkout -b";

      # python
      piv = "python -m venv .venv";
      psv = "source .venv/bin/activate";

      gemini = "bunx @google/gemini-cli";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}

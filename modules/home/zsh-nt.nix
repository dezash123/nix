{ host, lib, ...}: 
{
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
      export "MICRO_TRUECOLOR=1"
      export ACT_HOME=/home/dezash/vlsi/act_install
      export EDITOR=neovide
      export PATH="$ACT_HOME/bin:/home/dezash/.cargo/bin:$PATH"
      function y() {
      	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
      	yazi "$@" --cwd-file="$tmp"
      	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
      		cd -- "$cwd"
      	fi
      	rm -f -- "$tmp"
      }
      # tmux attach || tmux
    '';
    shellAliases = {
      # record = "wf-recorder --audio=alsa_output.pci-0000_08_00.6.analog-stereo.monitor -f $HOME/Videos/$(date +'%Y%m%d%H%M%S_1.mp4')";

      # Utils
      n = "neovide";
      c = "clear";
      cd = "z";
      cb = "cd ..";
      cat = "bat";
      code = "codium";
      py = "python";
      icat = "kitten icat";
      dsize = "du -hs";
      findw = "grep -rl";
      pdf = "tdf";
      open = "xdg-open";

      l = "lsd --group-directories-first";
      la = "lsd -A --group-directories-first";
      ll = "lsd -A --group-directories-first --long";
      tree = "lsd --tree --group-directories-first";

      # Nixos
      ns = "nix-shell --run zsh";
      nix-shell = "nix-shell --run zsh";
      nix-switch = "sudo nixos-rebuild switch --flake ~/nixos-config#${host}";
      nix-switchu = "sudo nixos-rebuild switch --upgrade --flake ~/nixos-config#${host}";
      nix-flake-update = "sudo nix flake update ~/nixos-config#";
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
      gcoe = "git config user.email";
      gcon = "git config user.name";

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

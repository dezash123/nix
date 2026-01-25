{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        clangd.enable = true;
        dockerls.enable = true;
        elixirls.enable = true;
        eslint.enable = true;
        gleam.enable = true;
        golangci_lint_ls.enable = true;
        gopls.enable = true;
        html.enable = true;
        htmx.enable = true;
        jsonls.enable = true;
        kotlin_language_server.enable = true;
        lua_ls.enable = true;
        markdown_oxide.enable = true;
        nixd.enable = true;
        ocamllsp.enable = true;
        postgres_lsp.enable = true;
        ruff.enable = true;
        verible.enable = true;
        starlark_rust = {
          enable = true;
          settings = {
            cmd = [
              "pcb"
              "lsp"
            ];
            filetypes = [
              "zen"
            ];
          };
        };
        svelte.enable = true;
        tailwindcss.enable = true;
        yamlls.enable = true;
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };
    rustaceanvim.enable = true;
    # error highlighting/explanation
    trouble.enable = true;
    # formatting help; maybe also lsp?
    none-ls = {
      enable = true;
      sources = {
        diagnostics = {
          credo.enable = true; # requires credo to be defined in the mix file
          golangci_lint.enable = true;
          ktlint.enable = true;
          statix.enable = true;
        };
        formatting = {
          fantomas.enable = true;
          gleam_format.enable = true;
          gofmt.enable = true;
          goimports.enable = true;
          ktlint.enable = true;
          nixfmt.enable = true;
          markdownlint.enable = true;
          shellharden.enable = true;
          shfmt.enable = true;
        };
      };
    };
  };
}

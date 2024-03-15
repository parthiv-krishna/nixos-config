# neovim configuration, should be imported to home-manager

{ pkgs, config, ... }:
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    ref = "nixos-23.11";
  });
in {
  imports = [
    nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    options = {
      # line numbers
      number = true;
      relativenumber = true;

      # search
      hlsearch = true;
      incsearch = true;
      ignorecase = true;
      showmatch = true;
      smartcase = true;

      # whitespace
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
    };

    colorschemes = { one.enable = true;
    };

    globals = {
      mapleader = "\\";
    };

    plugins = {
      # editor view
      airline.enable = true;
      barbar.enable = true;
      nvim-tree = {
        enable = true;

        # reclaim Ctrl-K for tmux navigator
        onAttach = {
          __raw = ''
            function(bufnr)
              local function opts(desc)
                return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
              end
            
              local api = require("nvim-tree.api")
              api.config.mappings.default_on_attach(bufnr)
              vim.keymap.set("n", "<C-K>", ":TmuxNavigateUp<CR>", opts("Refresh"))
            end
          '';
        };
      };
      todo-comments.enable = true;
      which-key.enable = true;

      # completion
      lspkind.enable = true;
      nvim-cmp = {
        enable = true;
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-S>" = "cmp.mapping.close()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<CR>" = "cmp.mapping.confirm({ select = false })";
          "<S-Tab>" = {
            action = "cmp.mapping.select_prev_item()";
            modes = [
              "i"
              "s"
            ];
          };
          "<Tab>" = {
            action = "cmp.mapping.select_next_item()";
            modes = [
              "i"
              "s"
            ];
          };
        };
        snippet.expand = "luasnip";
        sources = [
          { name = "nvim_lsp"; }
          { name = "cmdline"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        window.documentation.border = [
          "╭" "─" "╮" "│" "╯" "─" "╰" "│"
        ];
      };
      cmp-buffer.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-nvim-lua.enable = true; 
      cmp-cmdline.enable = true;
      cmp-path.enable = true;
      luasnip.enable = true;


      treesitter.enable = true;

      # language server
      clangd-extensions.enable = true;
      lsp = {
        enable = true;

        enabledServers = [
          "ccls"
          "nixd"
          "pylsp"
        ];
      };
      lsp-lines.enable = true;
      markdown-preview.enable = true;
      nix.enable = true;
      rust-tools.enable = true;

      # git
      fugitive.enable = true;
      gitsigns.enable = true;

      # tmux navigator
      tmux-navigator.enable = true;
    };

    keymaps = [
      # swap gj/j and gk/k
      {
        key = "j";
        action = "gj";
        mode = "n";
      }
      {
        key = "k";
        action = "gk";
        mode = "n";
      }
      {
        key = "gj";
        action = "j";
        mode = "n";
      }
      {
        key = "gk";
        action = "k";
        mode = "n";
      }
      # swap g<down>/<down> and g<up>/<up>
      {
        key = "<down>";
        action = "g<down>";
      }
      {
        key = "<up>";
        action = "g<up>";
      }
      {
        key = "g<up>";
        action = "<up>";
      }
      {
        key = "g<down>";
        action = "<down>";
      }
      # Toggle lsp lines
      {
        key = "<Leader>l";
        action = ":lua require('lsp_lines').toggle()<CR>";
      }
    ];
  };
}

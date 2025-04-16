{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    opts = {
        number = true;
        relativenumber = true;

        shiftwidth = 9;
    };

    globals.mapleader = " ";

    plugins.lsp = {
        enable = true;
        servers = {

	    jdtls.enable = true;
	    
            cmake.enable = true;

            clangd.enable = true;

            texlab.enable = true;

        };
    };

    plugins.cmp = {
      enable = true;
      autoEnableSources = true;
      settings = { sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
      ];

            mapping = {
                  "<CR>" = "cmp.mapping.confirm({ select = true })";
                  "<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
                  "<Up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
                  "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
                  "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
                  "<C-d>" = "cmp.mapping.scroll_docs(-4)";
                  "<C-f>" = "cmp.mapping.scroll_docs(4)";
                  "<C-Space>" = "cmp.mapping.complete()";

              };
        };
    };

    plugins.jdtls = {
  	enable = true;
  	#data =  "/home/romain/.cache/jdtls/config";
  	#configuration = "/home/romain/.cache/jdtls/workspace";
    };

    plugins.vimtex = {
        enable = true;
        texlivePackage = pkgs.texlive.combined.scheme-full;
    };

    plugins = {


        cmake-tools.enable = true;

        telescope.enable = true;

        oil = {
            enable = true;
        };

        treesitter.enable = true;

    };

    colorschemes.onedark.enable = true;

  };

}



#{ pkgs, ... }:
#{
#  programs.neovim = {
#    enable = true;
#    vimAlias = true;
#    plugins = with pkgs.vimPlugins; [
#      # (nvim-treesitter.withPlugins (plugins: pkgs.tree-sitter.allGrammars))
#      (nvim-treesitter.withPlugins (
#        plugins: with plugins; [
#          tree-sitter-c
#          tree-sitter-cpp
#          tree-sitter-dockerfile
#          tree-sitter-fish
#          tree-sitter-go
#          tree-sitter-html
#          tree-sitter-json
#          tree-sitter-latex
#          tree-sitter-lua
#          tree-sitter-nix
#          tree-sitter-python
#          tree-sitter-r
#          tree-sitter-regex
#          tree-sitter-rust
#          tree-sitter-toml
#          tree-sitter-vim
#          tree-sitter-yaml
#        ]
#      ))
#      coc-nvim
#      coc-pyright
#      coc-rust-analyzer
#      coc-clangd
#      dracula-vim
#      nord-nvim
#      vimtex
#      vim-nix
#      vim-fugitive
#      vim-commentary
#    ];
#  };
#}
#

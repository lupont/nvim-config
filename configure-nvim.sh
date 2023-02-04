#!/bin/sh

CFG_DIR="$HOME/.config/nvim"
PLUGIN_DIR="$HOME/.local/share/nvim/site/pack/plugin/start/"
REPO=https://github.com/lupont/nvim-config.git

if [ -d "$CFG_DIR" ]; then
    printf '%s already exists, exiting.\n' "$CFG_DIR"
    exit 0
fi

if [ -d "$PLUGIN_DIR" ]; then
    printf '%s already exists, exiting.\n' "$PLUGIN_DIR"
    exit 0
fi

git -C /tmp/ clone "$REPO"

mkdir -p "$CFG_DIR" "$PLUGIN_DIR"

mv /tmp/nvim-config/init.lua /tmp/nvim-config/colors /tmp/nvim-config/snippets "$CFG_DIR"

use() {
    git -C "$PLUGIN_DIR" clone "https://github.com/$1"
}

use dcampos/cmp-snippy
use dcampos/nvim-snippy
use echasnovski/mini.nvim
use hrsh7th/cmp-buffer
use hrsh7th/cmp-calc
use hrsh7th/cmp-nvim-lsp
use hrsh7th/cmp-nvim-lua
use hrsh7th/cmp-path
use hrsh7th/nvim-cmp
use jose-elias-alvarez/null-ls.nvim
use lewis6991/gitsigns.nvim
use neovim/nvim-lspconfig
use nvim-lua/plenary.nvim
use nvim-treesitter/nvim-treesitter
use nvim-treesitter/nvim-treesitter-context
use nvim-treesitter/nvim-treesitter-textobjects
use nvim-treesitter/playground
use tpope/vim-commentary
use tpope/vim-fugitive
use tpope/vim-repeat
use tpope/vim-surround

rm -rf /tmp/nvim-config/

nvim +'helptags ALL' -c q

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

git -C "$PLUGIN_DIR" clone https://github.com/dcampos/cmp-snippy.git
git -C "$PLUGIN_DIR" clone https://github.com/dcampos/nvim-snippy.git
git -C "$PLUGIN_DIR" clone https://github.com/echasnovski/mini.nvim.git
git -C "$PLUGIN_DIR" clone https://github.com/hrsh7th/cmp-buffer.git
git -C "$PLUGIN_DIR" clone https://github.com/hrsh7th/cmp-calc.git
git -C "$PLUGIN_DIR" clone https://github.com/hrsh7th/cmp-nvim-lsp.git
git -C "$PLUGIN_DIR" clone https://github.com/hrsh7th/cmp-nvim-lua.git
git -C "$PLUGIN_DIR" clone https://github.com/hrsh7th/cmp-path.git
git -C "$PLUGIN_DIR" clone https://github.com/hrsh7th/nvim-cmp.git
git -C "$PLUGIN_DIR" clone https://github.com/jose-elias-alvarez/null-ls.nvim.git
git -C "$PLUGIN_DIR" clone https://github.com/lewis6991/gitsigns.nvim.git
git -C "$PLUGIN_DIR" clone https://github.com/neovim/nvim-lspconfig.git
git -C "$PLUGIN_DIR" clone https://github.com/nvim-lua/plenary.nvim.git
git -C "$PLUGIN_DIR" clone https://github.com/nvim-treesitter/nvim-treesitter-context.git
git -C "$PLUGIN_DIR" clone https://github.com/nvim-treesitter/nvim-treesitter-textobjects.git
git -C "$PLUGIN_DIR" clone https://github.com/nvim-treesitter/nvim-treesitter.git
git -C "$PLUGIN_DIR" clone https://github.com/nvim-treesitter/playground.git
git -C "$PLUGIN_DIR" clone https://github.com/tpope/vim-commentary.git
git -C "$PLUGIN_DIR" clone https://github.com/tpope/vim-fugitive.git
git -C "$PLUGIN_DIR" clone https://github.com/tpope/vim-repeat.git
git -C "$PLUGIN_DIR" clone https://github.com/tpope/vim-surround.git

rm -rf /tmp/nvim-config/

nvim +'helptags ALL' -c q

vim.g.mapleader = " "
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.o.completeopt = "menu,menuone,noselect"
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.laststatus = 3
vim.o.mouse = "a"
vim.o.number = true
vim.o.path = "**"
vim.o.pumheight = 10
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.shiftwidth = 4
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.spell = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.suffixes = "/," .. vim.o.suffixes
vim.o.swapfile = false
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.wildignore = "*/build/*,*/htmlcov/*,*/target/*,*.pyc,*.o,*/__pycache__/*"
vim.o.wildignorecase = true

function D()
	if not vim.lsp.buf.server_ready() then
		return "LSP: -"
	end

	local e = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	local w = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	local i = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	local h = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })

	local errors = e ~= 0 and ("E" .. e .. " ") or ""
	local warns = w ~= 0 and ("W" .. w .. " ") or ""
	local info = i ~= 0 and ("I" .. i .. " ") or ""
	local hints = h ~= 0 and ("H" .. h) or ""

	local combined = errors .. warns .. info .. hints
	return string.format("LSP: %s", combined ~= "" and combined or "OK")
end

vim.o.statusline = "%<%f %h%m%r%12.{v:lua.D()}%=%-14.(%l,%c%V%) %P"

vim.cmd("colorscheme mellow")

vim.keymap.set("c", "<C-p>", "<Up>")
vim.keymap.set("c", "<C-n>", "<Down>")

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("n", "<Esc>", "<Esc>:noh<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { remap = true })

vim.keymap.set("n", "<leader>q", "<cmd>copen<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>lopen<CR>")

vim.keymap.set("n", "<C-q>", "<cmd>cclose<CR><cmd>lclose<CR>")

vim.keymap.set("n", "]q", "<cmd>cnext<CR>")
vim.keymap.set("n", "[q", "<cmd>cprev<CR>")

vim.keymap.set("n", "]w", "<cmd>lnext<CR>")
vim.keymap.set("n", "[w", "<cmd>lprev<CR>")

vim.keymap.set("n", "]b", "<cmd>bnext<CR>")
vim.keymap.set("n", "[b", "<cmd>bprev<CR>")

vim.keymap.set("n", "]t", "<cmd>tabnext<CR>")
vim.keymap.set("n", "[t", "<cmd>tabprev<CR>")

vim.keymap.set("n", "<leader>=", "<cmd>tab split<CR>")
vim.keymap.set("n", "<leader>-", "<cmd>tabclose<CR>")

vim.keymap.set("n", "<C-Space>", ":find *")
vim.keymap.set("n", "<leader>b", ":buffer *")

if vim.fn.executable("rg") == 1 then
	vim.o.grepprg = "rg --vimgrep --no-heading"
	vim.keymap.set("n", "<leader>f", ":grep -i ")
	vim.keymap.set("n", "<leader>F", ":grep -s ")
	vim.keymap.set("n", "<leader>l", ":lgrep -i  %<Left><Left>")
	vim.keymap.set("n", "<leader>L", ":lgrep -s  %<Left><Left>")
else
	vim.keymap.set("n", "<leader>f", ":grep -ir ")
	vim.keymap.set("n", "<leader>F", ":grep -r ")
	vim.keymap.set("n", "<leader>l", ":lgrep -i  %<Left><Left>")
	vim.keymap.set("n", "<leader>L", ":lgrep  %<Left><Left>")
end

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
})

local ftplugin = vim.api.nvim_create_augroup("Ftplugin", { clear = true })
local ft = function(patterns, callback)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = patterns,
		callback = callback,
		group = ftplugin,
	})
end

ft({ "fugitive", "fugitiveblame", "git" }, function()
	local opts = { remap = true, buffer = true }
	vim.keymap.set("n", "<Tab>", "=", opts)
	vim.keymap.set("n", "q", "gq", opts)
end)

ft("fugitive", function()
	vim.keymap.set("n", "<CR>", "gO<C-w>o", { remap = true, buffer = true })
end)

ft("gitcommit", function()
	vim.bo.spelllang = "en"
	vim.wo.colorcolumn = "72"
	vim.wo.spell = true
end)

ft("markdown", function()
	vim.bo.textwidth = 120
	vim.wo.colorcolumn = "80,88,120"
	vim.wo.spell = true
end)

ft("python", function()
	vim.bo.textwidth = 120
	vim.wo.colorcolumn = "72,80,88,120"
end)

ft("lua", function()
	vim.bo.tabstop = 2
	vim.bo.shiftwidth = 2
end)

vim.api.nvim_create_user_command("Format", function() vim.lsp.buf.format() end, {})
vim.api.nvim_create_user_command("W", "noautocmd w", {})

-- LSP
local lspconfig_exists, lspconfig = pcall(require, "lspconfig")
if lspconfig_exists then
	local on_attach = function(_, buffer)
		vim.api.nvim_buf_set_option(buffer, "omnifunc", "v:lua.vim.lsp.omnifunc")

		local opts = { buffer = true }
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	end

	local function lsp_setup(lsp, options)
		if vim.fn.executable(lspconfig[lsp].document_config.default_config.cmd[1]) == 1 then
			options = options or {}
			options.on_attach = on_attach
			lspconfig[lsp].setup(options)
		end
	end

	lsp_setup("bashls", { cmd_env = { SHELLCHECK_PATH = "" } })
	lsp_setup("cmake")
	lsp_setup("marksman")
	lsp_setup("pyright")
	lsp_setup("rust_analyzer")
	lsp_setup("sumneko_lua", { settings = { Lua = { diagnostics = { globals = { "vim" } } } } })
	lsp_setup("yamlls")
end

-- Treesitter
local treesitter_exists, treesitter = pcall(require, "nvim-treesitter.configs")
if treesitter_exists then
	treesitter.setup({
		ensure_installed = {
			"bash",
			"c",
			"cmake",
			"cpp",
			"css",
			"fish",
			"gitcommit",
			"help",
			"html",
			"javascript",
			"json",
			"lua",
			"make",
			"markdown",
			"python",
			"rust",
			"toml",
			"yaml",
      "dockerfile",
      "git_rebase",
      "haskell",
      "vim",
		},
		highlight = { enable = true },
		indent = { enable = false },
		textobjects = {
			select = {
				enable = true,

				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},

				include_surrounding_whitespace = true,
			},
		},
	})
end

local treesitter_context_exists, treesitter_context = pcall(require, "treesitter-context")
if treesitter_context_exists then
	treesitter_context.setup()
end

-- Fugitive
vim.keymap.set("n", "<leader><Space>", "<cmd>Git<CR><C-w>o")
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<CR>")
vim.keymap.set("n", "<leader>gB", "<cmd>Git branch<CR>")
vim.keymap.set("n", "<leader>gd", "<cmd>Git diff<CR>")
vim.keymap.set("n", "<leader>gD", "<cmd>Git diff --cached<CR>")
vim.keymap.set("n", "<leader>gff", "<cmd>Git fetch<CR>")
vim.keymap.set("n", "<leader>gfa", "<cmd>Git fetch --all<CR>")
vim.keymap.set("n", "<leader>gPP", "<cmd>Git pull<CR>")
vim.keymap.set("n", "<leader>gPr", "<cmd>Git pull --rebase<CR>")
vim.keymap.set("n", "<leader>gpp", "<cmd>Git push<CR>")
vim.keymap.set("n", "<leader>grr", ":Git rebase ")
vim.keymap.set("n", "<leader>gri", ":Git rebase -i ")

-- Gitsigns
local gitsigns_exists, gitsigns = pcall(require, "gitsigns")
if gitsigns_exists then
	gitsigns.setup({
		on_attach = function()
			vim.keymap.set("n", "]h", "&diff ? ']h' : ':<C-U>Gitsigns next_hunk<CR>'", { expr = true })
			vim.keymap.set("n", "[h", "&diff ? '[h' : ':<C-U>Gitsigns prev_hunk<CR>'", { expr = true })
			vim.keymap.set("n", "<leader>hr", ":<C-U>Gitsigns reset_hunk<CR>")
			vim.keymap.set("n", "<leader>hp", ":<C-U>Gitsigns preview_hunk<CR>")
			vim.keymap.set("n", "<leader>hs", ":<C-U>Gitsigns stage_hunk<CR>")
			vim.keymap.set("n", "<leader>hu", ":<C-U>Gitsigns undo_stage_hunk<CR>")
			vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
		end,

		signs = {
			add = { text = "+" },
			change = { text = "~" },
			changedelete = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
		},
	})
end

-- null-ls
local null_ls_exists, null_ls = pcall(require, "null-ls")
if null_ls_exists then
	local function add_null_source(sources, source)
		if vim.fn.executable(source.name) == 1 then
			sources[#sources + 1] = source
		end
	end

	local function null_sources()
		local sources = {}
		add_null_source(sources, null_ls.builtins.formatting.black)
		add_null_source(sources, null_ls.builtins.formatting.isort)
		add_null_source(sources, null_ls.builtins.formatting.shfmt)
		add_null_source(sources, null_ls.builtins.formatting.stylua)
		add_null_source(sources, null_ls.builtins.diagnostics.flake8)
		add_null_source(sources, null_ls.builtins.diagnostics.luacheck.with({ extra_args = { "--globals", "vim" } }))
		add_null_source(sources, null_ls.builtins.diagnostics.shellcheck)
		add_null_source(sources, null_ls.builtins.code_actions.shellcheck)
		return sources
	end

	null_ls.setup({
		diagnostics_format = "[#{s} #{c}] #{m}",
		sources = null_sources(),
	})
end

-- nvim-cmp
local cmp_exists, cmp = pcall(require, "cmp")
local luasnip_exists, luasnip = pcall(require, "luasnip")
if cmp_exists and luasnip_exists then
	cmp.setup({
		mapping = cmp.mapping.preset.insert({
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-u>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-c>"] = cmp.mapping.abort(),
			["<C-e>"] = cmp.mapping(function(fallback)
				if luasnip.expand_or_locally_jumpable() then
					luasnip.expand_or_jump()
				elseif cmp.visible() then
					cmp.confirm({ select = true })
				else
					fallback()
				end
			end, { "i", "s" }),
			["<C-y>"] = cmp.mapping(function(fallback)
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}),

		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},

		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "calc" },
		}, {
			{ name = "buffer" },
		}),

		experimental = {
			ghost_text = true,
		},
	})
end

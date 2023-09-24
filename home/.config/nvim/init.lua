local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup( {

	"rhysd/vim-color-spring-night",

	"farmergreg/vim-lastplace",

	"tpope/vim-commentary",
	"tpope/vim-fugitive",
	"tpope/vim-obsession",
	"tpope/vim-sensible",
	"tpope/vim-surround",
	"tpope/vim-unimpaired",

	"junegunn/fzf",
	"junegunn/fzf.vim",

	"christoomey/vim-tmux-navigator",
	"nanotee/zoxide.vim",

	"preservim/nerdtree",

	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/nvim-cmp",
	"hrsh7th/vim-vsnip",

	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",


}
, {}

)


require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = {

		"lua_ls",
		"jdtls",
		"kotlin_language_server",
		"rust_analyzer",
		"marksman"
	},
	automatic_installation = true,
}


-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = 'buffer' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})


local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--  require('lspconfig')['<LANG_SERVER'].setup {
--    capabilities = capabilities
--  }

--Enable (broadcasting) snippet capability for completion
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
--require'lspconfig'.jsonls.setup {
--  capabilities = capabilities,
--}
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
			client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = 'LuaJIT'
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME
							-- "${3rd}/luv/library"
							-- "${3rd}/busted/library",
						}
						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
						-- library = vim.api.nvim_get_runtime_file("", true)
					}
				}
			})

			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end
		return true
	end
}


lspconfig.docker_compose_language_service.setup{}
lspconfig.jdtls.setup{}
lspconfig.kotlin_language_server.setup{}
lspconfig.marksman.setup{}
lspconfig.pyright.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.lemminx.setup{}
lspconfig.yamlls.setup{}
lspconfig.sqlls.setup{}
lspconfig.terraformls.setup{}
lspconfig.tsserver.setup{}


vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.cursorline = true
-- vim.opt.cursorlineopt = "number"

vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.cmd [[colorscheme  spring-night]]
vim.cmd [[nmap ; :Buffers<CR>]]
vim.cmd [[nmap <Leader>t :Files<CR>]]
vim.cmd [[nmap <Leader>r :Tags<CR>]]
vim.cmd [[set clipboard=unnamed]]
vim.cmd [[silent !mkdir -p ~/.vim_undo > /dev/null 2>&1]]
vim.cmd [[set undodir=~/.vim_undo]]
vim.cmd [[set undofile]]
vim.cmd [[let g:session_autoload="'yes'"]]
vim.cmd [[let g:session_autosave="'yes"]]

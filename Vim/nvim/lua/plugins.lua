local fn = vim.fn
local execute = vim.api.nvim_command

-- {{{ Auto install packer.nvim if not exists
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.cmd("packadd packer.nvim")
vim.cmd("autocmd BufWritePost plugins.lua PackerCompile") -- Auto compile when there are changes in plugins.lua
-- }}}
--
--
return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	----------------  Color scheme --------------------------------------
	use("joshdick/onedark.vim")

	use("tanvirtin/monokai.nvim")

	use("Th3Whit3Wolf/one-nvim")

	use("sainnhe/sonokai")

	use("morhetz/gruvbox")

	use("rafamadriz/neon")

	use("folke/tokyonight.nvim")

	---------------------------------------------------------------------

	-------------------- LSP --------------------

	use("neovim/nvim-lspconfig")

	use("glepnir/lspsaga.nvim")

	use("ray-x/lsp_signature.nvim")

	use("nvim-lua/lsp-status.nvim")

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use("williamboman/nvim-lsp-installer")

	---------------------------------------

	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
		},
	})
	use("hrsh7th/cmp-nvim-lsp")
	-- Coq
	use({
		"ms-jpq/coq_nvim",
		branch = "coq",
	}) -- main one
	use({
		"ms-jpq/coq.artifacts",
		branch = "artifacts",
	}) -- 9000+ Snippets
	require("configs.coq")

	--{ Fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{
				"nvim-lua/plenary.nvim",
			},
		},
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})
	require("configs.telescope")
	------------------------------------

	--  Language helper
	use({
		"sheerun/vim-polyglot",
		cmd = "PolyglotEnable",
	})
	require("configs.vim-polyglot")

	--------------

	-- Tree file browser
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("configs.nvim-tree")
		end,
	})
	-- Status line
	use({
		"glepnir/galaxyline.nvim",
		branch = "main",
		-- your statusline
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
	})
	require("configs.galaxyline")

	-- { Hightlight

	use({
		"nvim-treesitter/nvim-treesitter",
	})
	use("nvim-treesitter/nvim-treesitter-refactor")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("nvim-treesitter/playground")
	use("p00f/nvim-ts-rainbow")

	require("configs.nvim-treesitter")
	-- }

	--  Icons
	use({
		"ryanoasis/vim-devicons",
	})

	use({
		"kyazdani42/nvim-web-devicons",
	})
	require("configs.nvim-web-devicons")
	-------------------------

	-- { Editing
	use({
		"windwp/nvim-autopairs",
	})
	require("configs.nvim-autopairs")

	use("windwp/nvim-ts-autotag")
	require("nvim-ts-autotag").setup()

	use({
		"norcalli/nvim-colorizer.lua",
	})
	require("configs.nvim-colorizer")

	-- use "lukas-reineke/format.nvim"
	-- require(
	--     "configs.format-nvim"
	-- )

	use("jose-elias-alvarez/null-ls.nvim")
	-- require("configs.null-ls")

	use("b3nj5m1n/kommentary")
	require("configs.kommentary")

	use({
		"tommcdo/vim-lion",
	})

	use({
		"prettier/vim-prettier",
		run = "yarn install",
		ft = {
			"javascript",
			"typescript",
			"css",
			"less",
			"scss",
			"graphql",
			"markdown",
			"vue",
			"html",
		},
	})
	use("mattn/emmet-vim")

	use("turbio/bracey.vim")
	-- }

	-- {Navigation
	use("phaazon/hop.nvim")
	require("configs.hop-nvim")

	use({
		"unblevable/quick-scope",
	})

	use("psliwka/vim-smoothie")

	-- }

	-- {Git
	use({
		"tpope/vim-fugitive",
	})
	use({
		"junegunn/gv.vim",
	})
	-- }
end)

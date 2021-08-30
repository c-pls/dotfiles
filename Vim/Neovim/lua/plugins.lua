local fn = vim.fn
local execute = vim.api.nvim_command

-- {{{ Auto install packer.nvim if not exists
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
                install_path)
end


 vim.cmd 'packadd packer.nvim'
 vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua
-- }}}
--
--
return require('packer').startup(function()
    -- Packer can manage itself
    use {'wbthomason/packer.nvim'}

    -- { Color scheme
     use 'joshdick/onedark.vim'

     use 'tanvirtin/monokai.nvim'

     use 'Th3Whit3Wolf/one-nvim'

     use 'sainnhe/sonokai'

     use 'morhetz/gruvbox'

     use 'ghifarit53/tokyonight-vim'

    -- }

    --{ LSP

     use {'neovim/nvim-lspconfig'}

     use {'glepnir/lspsaga.nvim'}

     use 'ray-x/lsp_signature.nvim'

     use 'nvim-lua/lsp-status.nvim'

     use 'kabouzeid/nvim-lspinstall'

    --}

    --{ Completion
  use {
  "hrsh7th/nvim-cmp",
  requires = {
    "hrsh7th/cmp-buffer",
  }
}
  use 'hrsh7th/cmp-nvim-lsp'
 -- require('configs.nvim-cmp')
    --}
    --


    -- Coq
  use { 'ms-jpq/coq_nvim', branch = 'coq'} -- main one
 use { 'ms-jpq/coq.artifacts', branch= 'artifacts'} -- 9000+ Snippets
 require('configs.coq')

    --{ Fuzzy finder
    use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}
    --}

    -- { Language helper
    use {'sheerun/vim-polyglot', cmd = 'PolyglotEnable'}

    -- }

    -- Tree file browser
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
}
  require('configs.nvim-tree')
   -- Status line
   use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    -- your statusline
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
}
  require('configs.galaxyline')

  -- { Hightlight

    use {'nvim-treesitter/nvim-treesitter'}
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/playground'
    use 'p00f/nvim-ts-rainbow'

    require('configs.nvim-treesitter')
  -- }

    -- {{{ Icons
    use {'ryanoasis/vim-devicons'}

    use {'kyazdani42/nvim-web-devicons'}
    require('configs.nvim-web-devicons')
    -- }}}


    -- { Editing
    use {'windwp/nvim-autopairs'}
    require('configs.nvim-autopairs')

    use {'norcalli/nvim-colorizer.lua'}
    require('configs.nvim-colorizer')

    use 'lukas-reineke/format.nvim'
    require('configs.format-nvim')

    use 'b3nj5m1n/kommentary'
    require('configs.kommentary')

    use {'tommcdo/vim-lion'}

    use {
        'prettier/vim-prettier',
        run = 'yarn install',
        ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'graphql', 'markdown', 'vue', 'html'}
    }
    -- }

    -- {Navigation
    use 'phaazon/hop.nvim'
    require('configs.hop-nvim')

    use {'unblevable/quick-scope'}

    use 'psliwka/vim-smoothie'

    -- }


    -- {Git
    use {'tpope/vim-fugitive'}
    use {'junegunn/gv.vim'}
    -- }

    -- Vim go
   -- use 'fatih/vim-go'


    -- Other
    use 'machakann/vim-sandwich'


  end)


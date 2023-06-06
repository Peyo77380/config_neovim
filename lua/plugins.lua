local ensure_packer = function () 
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd[[packeradd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Install your plugins here
return require('packer').startup(function(use)
	-- My plugins here
	use "wbthomason/packer.nvim" -- Have packer manage itself
	use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
	use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.1',
		requires = {
			{'nvim-lua/plenary.nvim'}
		}
	}

	
	-- Colorschemes
	use "folke/tokyonight.nvim" 

	use "neovim/nvim-lspconfig"
	use({ -- CMP completion engine
	 "hrsh7th/nvim-cmp",
	 requires = {
	  "onsails/lspkind-nvim",     -- Icons on the popups
	  "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
	  "saadparwaiz1/cmp_luasnip", -- Snippets source
	  "L3MON4D3/LuaSnip",         -- Snippet engine
	 },
	 config = function()
	  require("config.cmp")
	 end,
	})
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "hrsh7th/cmp-nvim-lua"
	use "hrsh7th/cmp-nvim-lsp"

	use "neomake/neomake"

	use "nvim-treesitter/nvim-treesitter" 
	use {'neoclide/coc.nvim', branch = 'release'}  
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)

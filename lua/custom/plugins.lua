local plugins = {
 -- {
 --    "neoclide/coc.nvim",
 --    ft="php",
 --    branch="release"
 --  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "intelephense",
        "html-lsp",
        "prettier",
        "eslint-lsp",
        "lua-language-server",
        "clangd",
        "cssls"
      }
    }
  },
  {
    "neovim/nvim-lspconfig",

   dependencies = {
     "jose-elias-alvarez/null-ls.nvim",
     config = function()
       require "custom.configs.null-ls"
     end,
   },
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    config = function ()
      require("chatgpt").setup({
        api_key_cmd = "echo $CHATGPTNVIM_KEY",
      })
    end
  },
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    opts = {
      combine_args = true
    }
  }
}

return plugins

local plugins = {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    opt = {
      ensure_installed = {
        "apex_ls",
        "bashls",
        "cssls",
        "dockerls",
        "docker_compose_language_service",
        "eslint",
        "html",
        "jsonls",
        "tsserver",
        "lua_ls",
        "remark_ls",
        "spectral",
        "intelephense",
        "pyright",
        "sqlls",
        "svelte",
        "tailwindcss",
        "vuels",
        'yamlls',
        'lemminx'
      }
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
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

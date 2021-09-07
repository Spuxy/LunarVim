return {
  -- Packer can manage itself as an optional plugin
  { "wbthomason/packer.nvim" },
  { "neovim/nvim-lspconfig" },
  { "tamago324/nlsp-settings.nvim" },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "antoinemadec/FixCursorHold.nvim" }, -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  {
    "kabouzeid/nvim-lspinstall",
    event = "VimEnter",
    config = function()
      local lspinstall = require "core.lspinstall"
      lspinstall.setup()
    end,
  },

  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("core.telescope").setup()
    end,
    disable = not lvim.builtin.telescope.active,
  },

  -- Completion & Snippets
  {
    "hrsh7th/nvim-compe",
    event = "InsertEnter",
    config = function()
      require("core.compe").setup()
    end,
    disable = not lvim.builtin.compe.active,
    -- wants = "vim-vsnip",
    -- requires = {
    -- {
    --   "hrsh7th/vim-vsnip",
    --   wants = "friendly-snippets",
    --   event = "InsertCharPre",
    -- },
    -- {
    --   "rafamadriz/friendly-snippets",
    --   event = "InsertCharPre",
    -- },
    -- },
  },
  {
    "hrsh7th/vim-vsnip",
    -- wants = "friendly-snippets",
    event = "InsertEnter",
    disable = not lvim.builtin.compe.active,
  },
  {
    "rafamadriz/friendly-snippets",
    event = "InsertCharPre",
    disable = not lvim.builtin.compe.active,
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    -- event = "InsertEnter",
    after = "nvim-compe",
    config = function()
      require("core.autopairs").setup()
    end,
    disable = not lvim.builtin.autopairs.active or not lvim.builtin.compe.active,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "0.5-compat",
    -- run = ":TSUpdate",
    config = function()
      require("core.treesitter").setup()
    end,
  },

  -- NvimTree
  {
    "kyazdani42/nvim-tree.lua",
    -- event = "BufWinOpen",
    -- cmd = "NvimTreeToggle",
    -- commit = "fd7f60e242205ea9efc9649101c81a07d5f458bb",
    config = function()
      require("core.nvimtree").setup()
    end,
    disable = not lvim.builtin.nvimtree.active,
  },

  {
    "lewis6991/gitsigns.nvim",

    config = function()
      require("core.gitsigns").setup()
    end,
    event = "BufRead",
    disable = not lvim.builtin.gitsigns.active,
  },

  -- Whichkey
  {
    "folke/which-key.nvim",
    config = function()
      require("core.which-key").setup()
    end,
    event = "BufWinEnter",
    disable = not lvim.builtin.which_key.active,
  },

  -- Comments
  {
    "terrortylor/nvim-comment",
    event = "BufRead",
    config = function()
      require("core.comment").setup()
    end,
    disable = not lvim.builtin.comment.active,
  },

  -- project.nvim
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("core.project").setup()
    end,
    disable = not lvim.builtin.project.active,
  },

  -- Icons
  { "kyazdani42/nvim-web-devicons" },

  -- Status Line and Bufferline
  {
    -- "hoob3rt/lualine.nvim",
    "shadmansaleh/lualine.nvim",
    -- "Lunarvim/lualine.nvim",
    config = function()
      require("core.lualine").setup()
    end,
    disable = not lvim.builtin.lualine.active,
  },

  {
    "romgrk/barbar.nvim",
    config = function()
      require("core.bufferline").setup()
    end,
    event = "BufWinEnter",
    disable = not lvim.builtin.bufferline.active,
  },

  -- Debugging
  {
    "mfussenegger/nvim-dap",
    -- event = "BufWinEnter",
    config = function()
      require("core.dap").setup()
    end,
    disable = not lvim.builtin.dap.active,
  },

  -- Debugger management
  {
    "Pocco81/DAPInstall.nvim",
    -- event = "BufWinEnter",
    -- event = "BufRead",
    disable = not lvim.builtin.dap.active,
  },

  -- Dashboard
  {
    "ChristianChiarulli/dashboard-nvim",
    event = "BufWinEnter",
    config = function()
      require("core.dashboard").setup()
    end,
    disable = not lvim.builtin.dashboard.active,
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
    config = function()
      require("core.terminal").setup()
    end,
    disable = not lvim.builtin.terminal.active,
  },
  {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  {
    'universal-ctags/ctags',
  },
  {
    'tpope/vim-surround',
  },
  -- Document generation
  { 'kkoomen/vim-doge', run = ':call doge#install()'},

  -- Php
  {'phpactor/phpactor'},

  -- Raibow braces
  {'luochen1990/rainbow'},

  -- Todo plugin
  { "folke/todo-comments.nvim", config = function() require("todo-comments").setup {} end },

  -- Outline/File structure
  {
    "simrat39/symbols-outline.nvim",
    event = "BufRead",
    opt = true,
    config = function ()
      require('symbols-outline').setup {
            highlight_hovered_item = false,
            show_guides = true,
            auto_preview = false,
            position = 'right',
            width = 20,
            show_numbers = false,
            show_relative_numbers = false,
            show_symbol_details = true,
            keymaps = { -- These keymaps can be a string or a table for multiple keys
                close = {"<Esc>", "q"},
                goto_location = "<Cr>",
                focus_location = "o",
                hover_symbol = "<C-space>",
                toggle_preview = "K",
                rename_symbol = "r",
                code_actions = "a",
            },
            lsp_blacklist = {},
                symbol_blacklist = {},
                symbols = {
                    File = {icon = "", hl = "TSURI"},
                    Module = {icon = "", hl = "TSNamespace"},
                    Namespace = {icon = "", hl = "TSNamespace"},
                    Package = {icon = "", hl = "TSNamespace"},
                    Class = {icon = "", hl = "TSType"},
                    Method = {icon = "", hl = "TSMethod"},
                    Property = {icon = "襁", hl = "TSMethod"},
                    Field = {icon = "ﴲ", hl = "TSField"},
                    Constructor = {icon = "", hl = "TSConstructor"},
                    Enum = {icon = "練", hl = "TSType"},
                    Interface = {icon = "ﰮ", hl = "TSType"},
                    Function = {icon = "", hl = "TSFunction"},
                    Variable = {icon = "[]", hl = "TSConstant"},
                    Constant = {icon = "ﲀ", hl = "TSConstant"},
                    String = {icon = "𝓐", hl = "TSString"},
                    Number = {icon = "#", hl = "TSNumber"},
                    Boolean = {icon = "⊨", hl = "TSBoolean"},
                    Array = {icon = "", hl = "TSConstant"},
                    Object = {icon = "⦿", hl = "TSType"},
                    Key = {icon = "🔐", hl = "TSType"},
                    Null = {icon = "NULL", hl = "TSType"},
                    EnumMember = {icon = "", hl = "TSField"},
                    Struct = {icon = "ﳤ", hl = "TSType"},
                    Event = {icon = "", hl = "TSType"},
                    Operator = {icon = "", hl = "TSOperator"},
                    TypeParameter = {icon = "𝙏", hl = "TSParameter"}
                }
      }
    end
  },

  -- Database
   { 'tpope/vim-dadbod' },
   { 'kristijanhusak/vim-dadbod-ui' },
   { 'kristijanhusak/vim-dadbod-completion' },

   { 'andymass/vim-matchup' },
   { 'kevinhwang91/nvim-bqf' },
   { 'glepnir/lspsaga.nvim' },
   {
    'NTBBloodbath/rest.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('rest-nvim').setup()
    end
  },
  { "folke/lsp-colors.nvim" },
  -- {
  --   "folke/trouble.nvim",
  --   requires = "kyazdani42/nvim-web-devicons",
  --   config = function()
  --     require("trouble").setup {
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       -- refer to the configuration section below
  --     }
  --   end
  -- },
   {
    "ray-x/lsp_signature.nvim",
    config = function()
    cfg = {
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      doc_lines = 2, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
      floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
      fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
      hint_enable = true, -- virtual hint enable
      hint_prefix = "🤙 ",  -- Panda for parameter
      hint_scheme = "String",
      use_lspsaga = false,  -- set to true if you want to use lspsaga popup
      hi_parameter = "Search", -- how your parameter will be highlight
      max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
      max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
        handler_opts = {
          border = "shadow"   -- double, single, shadow, none
        },
      extra_trigger_chars = {} -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
    }
      require("lsp_signature").setup()
      require("lsp_signature").on_attach(cfg)
    end
  },
  { 'sindrets/diffview.nvim' },
  { 'christianchiarulli/nvcode-color-schemes.vim' },
  { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' },
  {
    'kristijanhusak/orgmode.nvim',
    ft = {'org'},
    config = function()
      require('orgmode').setup{}
    end
  },
  {
    "vhyrro/neorg",
     config = function()
          require('neorg').setup {
              -- Tell Neorg what modules to load
              load = {
                  ["core.defaults"] = {}, -- Load all the default modules
                  ["core.norg.concealer"] = {}, -- Allows for use of icons
                  ["core.norg.dirman"] = { -- Manage your directories with Neorg
                      config = {
                          workspaces = {
                              my_workspace = "~/neorg"
                          }
                      }
                  }
              },
          }
     end,
     requires = "nvim-lua/plenary.nvim"
  }
}

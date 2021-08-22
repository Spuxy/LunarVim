return {
  -- Packer can manage itself as an optional plugin
  { "wbthomason/packer.nvim" },
  { "neovim/nvim-lspconfig" },
  { "tamago324/nlsp-settings.nvim" },
  { "jose-elias-alvarez/null-ls.nvim" },
  {
    "kabouzeid/nvim-lspinstall",
    event = "VimEnter",
    config = function()
      local lspinstall = require "lspinstall"
      lspinstall.setup()
      if lvim.builtin.lspinstall.on_config_done then
        lvim.builtin.lspinstall.on_config_done(lspinstall)
      end
    end,
  },

  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("core.telescope").setup()
      if lvim.builtin.telescope.on_config_done then
        lvim.builtin.telescope.on_config_done(require "telescope")
      end
    end,
    disable = not lvim.builtin.telescope.active,
  },

  -- Completion & Snippets
  {
    "hrsh7th/nvim-compe",
    event = "InsertEnter",
    config = function()
      require("core.compe").setup()
      if lvim.builtin.compe.on_config_done then
        lvim.builtin.compe.on_config_done(require "compe")
      end
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
      if lvim.builtin.autopairs.on_config_done then
        lvim.builtin.autopairs.on_config_done(require "nvim-autopairs")
      end
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
      if lvim.builtin.treesitter.on_config_done then
        lvim.builtin.treesitter.on_config_done(require "nvim-treesitter.configs")
      end
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
      if lvim.builtin.nvimtree.on_config_done then
        lvim.builtin.nvimtree.on_config_done(require "nvim-tree.config")
      end
    end,
    disable = not lvim.builtin.nvimtree.active,
  },

  {
    "lewis6991/gitsigns.nvim",

    config = function()
      require("core.gitsigns").setup()
      if lvim.builtin.gitsigns.on_config_done then
        lvim.builtin.gitsigns.on_config_done(require "gitsigns")
      end
    end,
    event = "BufRead",
    disable = not lvim.builtin.gitsigns.active,
  },

  -- Whichkey
  {
    "folke/which-key.nvim",
    config = function()
      require("core.which-key").setup()
      if lvim.builtin.which_key.on_config_done then
        lvim.builtin.which_key.on_config_done(require "which-key")
      end
    end,
    event = "BufWinEnter",
    disable = not lvim.builtin.which_key.active,
  },

  -- Comments
  {
    "terrortylor/nvim-comment",
    event = "BufRead",
    config = function()
      require("nvim_comment").setup()
      if lvim.builtin.comment.on_config_done then
        lvim.builtin.comment.on_config_done(require "nvim_comment")
      end
    end,
    disable = not lvim.builtin.comment.active,
  },

  -- project.nvim
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("core.project").setup()
      if lvim.builtin.project.on_config_done then
        lvim.builtin.project.on_config_done()
      end
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
      if lvim.builtin.bufferline.on_config_done then
        lvim.builtin.bufferline.on_config_done()
      end
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
      if lvim.builtin.dap.on_config_done then
        lvim.builtin.dap.on_config_done(require "dap")
      end
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
      if lvim.builtin.dashboard.on_config_done then
        lvim.builtin.dashboard.on_config_done(require "dashboard")
      end
    end,
    disable = not lvim.builtin.dashboard.active,
  },

  -- Terminal
  {
    "akinsho/nvim-toggleterm.lua",
    event = "BufWinEnter",
    config = function()
      require("core.terminal").setup()
      if lvim.builtin.terminal.on_config_done then
        lvim.builtin.terminal.on_config_done(require "toggleterm")
      end
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
  {'kkoomen/vim-doge', run = ':call doge#install()'},

  -- Php
  {'phpactor/phpactor'},

  -- Raibow braces
  {'luochen1990/rainbow'},

  -- Todo plugin
  {"folke/todo-comments.nvim", config = function() require("todo-comments").setup {} end },

  -- Outline/File structure
  {'simrat39/symbols-outline.nvim'},

  -- Databasde
   {'tpope/vim-dadbod'},
   {'kristijanhusak/vim-dadbod-ui'},
   {'kristijanhusak/vim-dadbod-completion'},

   {'andymass/vim-matchup'},
   {'kevinhwang91/nvim-bqf'},
   {'glepnir/lspsaga.nvim'},
   {
    'NTBBloodbath/rest.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('rest-nvim').setup()
    end
  },
  {'folke/lsp-colors.nvim'},
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
  {'edluffy/specs.nvim',
      config = function()
        require('specs').setup{
           show_jumps  = true,
            min_jump = 30,
            popup = {
                delay_ms = 0, -- delay before popup displays
                inc_ms = 10, -- time increments used for fade/resize effects 
                blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
                width = 10,
                winhl = "PMenu",
                fader = require('specs').linear_fader,
                resizer = require('specs').shrink_resizer
            },
            ignore_filetypes = {},
            ignore_buftypes = {
            nofile = true,
        },
      }
    end
  },
  {'sindrets/diffview.nvim'},
  {'Rigellute/shades-of-purple.vim'},
  {'christianchiarulli/nvcode-color-schemes.vim'},
  { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' },
  {'kristijanhusak/orgmode.nvim',
    ft = {'org'},
    config = function()
      require('orgmode').setup{}
    end
  },
  {"vhyrro/neorg",
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

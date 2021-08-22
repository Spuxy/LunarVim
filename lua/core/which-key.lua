local M = {}
M.config = function()
  lvim.builtin.which_key = {
    ---@usage disable which-key completely [not recommeded]
    active = true,
    setup = {
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          operators = false, -- adds help for operators like d, y, ...
          motions = false, -- adds help for motions
          text_objects = false, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
        spelling = { enabled = true, suggestions = 20 }, -- use which-key for spelling hints
      },
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
      window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
      },
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
      show_help = true, -- show help message on the command line when the popup is visible
    },

    opts = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    vopts = {
      mode = "v", -- VISUAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },
    -- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
    -- see https://neovim.io/doc/user/map.html#:map-cmd
    vmappings = {
      ["/"] = { ":CommentToggle<CR>", "Comment" },
    },
    mappings = {
      ["v"] = { "<cmd>vsplit<CR>", "VSplit" },
      ["h"] = { "<cmd>split<CR>", "HSplit" },
      ["w"] = { "<cmd>w!<CR>", "Save" },
      ["q"] = { "<cmd>q!<CR>", "Quit" },
      ["/"] = { "<cmd>CommentToggle<CR>", "Comment" },
      ["c"] = { "<cmd>BufferClose!<CR>", "Close Buffer" },
      ["f"] = { "<cmd>Telescope find_files<CR>", "Find File" },
      ["e"] = { "<cmd>:HopWord<CR>", "EasyMotion" },
      ["H"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
      ["G"] = {" <cmd>:DogeGenerate<CR>", "generate doc"},
      b = {
        name = "Buffers",
        b = { "<cmd>BufferPick<cr>", "jump to buffer" },
        f = { "<cmd>Telescope buffers<cr>", "Find buffer" },
        w = { "<cmd>BufferWipeout<cr>", "wipeout buffer" },
        e = {
          "<cmd>BufferCloseAllButCurrent<cr>",
          "close all but current buffer",
        },
        h = { "<cmd>BufferCloseBuffersLeft<cr>", "close all buffers to the left" },
        l = {
          "<cmd>BufferCloseBuffersRight<cr>",
          "close all BufferLines to the right",
        },
        D = {
          "<cmd>BufferOrderByDirectory<cr>",
          "sort BufferLines automatically by directory",
        },
        L = {
          "<cmd>BufferOrderByLanguage<cr>",
          "sort BufferLines automatically by language",
        },
      },
      p = {
        name = "Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        r = { "<cmd>lua require('utils').reload_lv_config()<cr>", "Reload" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
      },
      n = {
        name = "Todo",
        n = { "<cmd>TodoTrouble<cr>", "Term" },
        F = { "FIX: ", "Fix" },
        H = { "HACK: ", "HACK" },
        P = { "PREF: ", "PREF" },
        T = { "TODO: ", "TODO" },
        N = { "NOTE: ", "NOTE" },
        W = { "WARNING: ", "WARNING" },
        f = { "<cmd>TodoTelescope<cr>", "Telescope" },
      },
      d = {
       name = '+database' ,
       u = {'<cmd>DBUIToggle<CR>'        , 'db ui toggle'},
       f = {'<cmd>DBUIFindBuffe<CR>'     , 'db find buffer'},
       r = {'<cmd>DBUIRenameBuffe<CR>'   , 'db rename buffer'},
       l = {'<cmd>DBUILastQueryInf<CR>'  , 'db last query'},
      },
      -- " Available Debug Adapters:
      -- "   https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/
      -- " Adapter configuration and installation instructions:
      -- "   https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
      -- " Debug Adapter protocol:
      -- "   https://microsoft.github.io/debug-adapter-protocol/
      -- " Debugging
      g = {
        name = "Git",
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = {
          "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
          "Undo Stage Hunk",
        },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        C = {
          "<cmd>Telescope git_bcommits<cr>",
          "Checkout commit(for current file)",
        },
      },
      l = {
        name = "LSP",
        a = { "<cmd>:Lspsaga code_action<cr>", "Code Action" },
        d = {
          "<cmd>Telescope lsp_document_diagnostics<cr>",
          "Document Diagnostics",
        },
        w = {
          "<cmd>Telescope lsp_workspace_diagnostics<cr>",
          "Workspace Diagnostics",
        },
        f = { "<cmd>silent FormatWrite<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        j = {
          ":Lspsaga diagnostic_jump_next<cr>",
          "Next Diagnostic",
        },
        k = {
          ":Lspsaga diagnostic_jump_prev<cr>",
          "Prev Diagnostic",
        },
        l = { "<cmd>silent lua require('lint').try_lint()<cr>", "Lint" },
        q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
        h = { "<cmd>:Lspsaga hover_doc<cr>", "Hover Doc" },
        p = { "<cmd>:Lspsaga preview_definition<cr>", "Preview" },
        r = { "<cmd>:Lspsaga rename<cr>", "Rename" },
        s = { "<cmd>:Lspsaga signature_help<cr>", "Signature" },
        O = {
          "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
          "Workspace Symbols",
        },
        o = {
          "<cmd>:SymbolsOutline<cr>",
          "Outline Symbols",
        },
      },
      L = {
        name = "+LunarVim",
        c = {
          "<cmd>edit ~/.config/lvim/config.lua<cr>",
          "Edit config.lua",
        },
        f = {
          "<cmd>lua require('core.telescope').find_lunarvim_files()<cr>",
          "Find LunarVim files",
        },
        g = {
          "<cmd>lua require('core.telescope').grep_lunarvim_files()<cr>",
          "Grep LunarVim files",
        },
        k = { "<cmd>lua require('keymappings').print()<cr>", "View LunarVim's default keymappings" },
        i = {
          "<cmd>lua require('core.info').toggle_popup(vim.bo.filetype)<cr>",
          "Toggle LunarVim Info",
        },
        l = {
          name = "+logs",
          d = {
            "<cmd>lua require('core.terminal').toggle_log_view('lunarvim')<cr>",
            "view default log",
          },
          D = { "<cmd>edit ~/.cache/nvim/lunarvim.log<cr>", "Open the default logfile" },
          n = { "<cmd>lua require('core.terminal').toggle_log_view('lsp')<cr>", "view lsp log" },
          N = { "<cmd>edit ~/.cache/nvim/log<cr>", "Open the Neovim logfile" },
          l = { "<cmd>lua require('core.terminal').toggle_log_view('nvim')<cr>", "view neovim log" },
          L = { "<cmd>edit ~/.cache/nvim/lsp.log<cr>", "Open the LSP logfile" },
          p = {
            "<cmd>lua require('core.terminal').toggle_log_view('packer.nvim')<cr>",
            "view packer log",
          },
          P = { "<cmd>edit ~/.cache/nvim/packer.nvim.log<cr>", "Open the Packer logfile" },
        },
      },
      r = {
        name = "Rest",
        r = {"<cmd>:lua require('rest-nvim').run()<CR>", "Run Http"},
        p = {"<cmd>:lua require('rest-nvim').run()<CR>", "Preview Http"},
      },
      s = {
        name = "Search",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        t = { "<cmd>Telescope live_grep<cr>", "Text" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        p = {
          "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
          "Colorscheme with Preview",
        },
      },
      t = {
        name = "Terminal",
        t = { ":FloatermToggle<cr>", "Toggle" },
        n = { ":FloatermNew<cr>", "New" },
        h = { ":FloatermPrev<cr>", "Prev" },
        l = { ":FloatermNext<cr>", "Next" },
      },
      T = {
        name = "Treesitter",
        i = { ":TSConfigInfo<cr>", "Info" },
      },
    },
  }
end

M.setup = function()
  local which_key = require "which-key"

  which_key.setup(lvim.builtin.which_key.setup)

  local opts = lvim.builtin.which_key.opts
  local vopts = lvim.builtin.which_key.vopts

  local mappings = lvim.builtin.which_key.mappings
  local vmappings = lvim.builtin.which_key.vmappings

  which_key.register(mappings, opts)
  which_key.register(vmappings, vopts)
end

return M

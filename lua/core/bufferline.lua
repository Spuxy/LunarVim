local M = {}

M.config = function()
  lvim.builtin.bufferline = {
    active = true,
    keymap = {
      normal_mode = {
        ["<A-Right>"] = ":BufferNext<CR>",
        ["<A-Left>"] = ":BufferPrevious<CR>",
        ["<A-w>"] = ":BufferClose<CR>",
        ["<S-A-Left>"] = ":BufferMovePrevious<CR>",
        ["<S-A-Right>"] = ":BufferMoveNext<CR>",
      },
    },
  }
end

M.setup = function()
  local keymap = require "keymappings"
  keymap.append_to_defaults(lvim.builtin.bufferline.keymap)
end

return M

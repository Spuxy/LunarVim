local M = {}

M.config = function()
  lvim.builtin.bufferline = {
    active = true,
    on_config_done = nil,
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

  if lvim.builtin.bufferline.on_config_done then
    lvim.builtin.bufferline.on_config_done()
  end
end

return M

-- Add claude to PATH
vim.env.PATH = vim.env.PATH .. ":/Users/yushengsu/.local/bin"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load .vimrc settings (vim-plug stubbed via autoload/plug.vim)
vim.cmd("command! -nargs=+ -bar Plug :")
if vim.fn.filereadable(vim.fn.expand("~/.vimrc")) == 1 then
  pcall(function() vim.cmd("source ~/.vimrc") end)
end

-- Enable mouse support (allows dragging to resize splits)
vim.opt.mouse = "a"

-- Minimal statusline: only file path + line/column
vim.opt.statusline = " %f  Line: %l  Column: %c"

-- Reduce command line height
vim.opt.cmdheight = 1

-- Hide mode indicator (e.g. -- TERMINAL --, -- INSERT --)
vim.opt.showmode = false

-- Setup plugins
require("lazy").setup("plugins")

-- Quit all when the last real buffer is closed
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local wins = vim.api.nvim_list_wins()
    local real = 0
    for _, w in ipairs(wins) do
      local buf = vim.api.nvim_win_get_buf(w)
      local ft = vim.bo[buf].filetype
      local bt = vim.bo[buf].buftype
      -- Skip nvim-tree, toggleterm, and other utility windows
      if ft ~= "NvimTree" and bt ~= "terminal" and bt ~= "nofile" then
        real = real + 1
      end
    end
    -- If this is the last real window, quit everything
    if real <= 1 then
      vim.cmd("qall!")
    end
  end,
})

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-`>]],
      direction = "horizontal",
      size = 15,
      shade_terminals = false,
      start_in_insert = true,
      shell = vim.o.shell,
    })

    -- Hide statusline for terminal windows
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "*",
      callback = function()
        vim.opt_local.statusline = " "
      end,
    })

    -- Always enter insert mode when entering terminal window
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "term://*",
      command = "startinsert",
    })

    -- Automatically open the bottom terminal when Neovim starts
    vim.api.nvim_create_autocmd("UIEnter", {
      once = true,
      callback = function()
        vim.defer_fn(function()
          vim.cmd("ToggleTerm")
          vim.defer_fn(function()
            -- Switch back to editor and ensure normal mode
            vim.cmd("wincmd k")
            vim.cmd("stopinsert")
          end, 100)
        end, 300)
      end,
    })
  end,
}

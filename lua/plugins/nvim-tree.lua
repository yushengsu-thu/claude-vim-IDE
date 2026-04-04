return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup({
      view = {
        side = "left",
        width = 30,
      },
      renderer = {
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = false,
          },
          glyphs = {
            default = "F ",
            folder = {
              arrow_closed = ">",
              arrow_open = "v",
              default = "D ",
              open = "D ",
              empty = "D ",
              empty_open = "D ",
            },
          },
        },
      },
    })

    -- Ctrl+N to toggle file explorer
    vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
  end,
}

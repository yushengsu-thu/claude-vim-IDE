return {
  "greggh/claude-code.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("claude-code").setup({
      window = {
        position = "vertical rightbelow vsplit",
        split_ratio = 0.4,
      },
    })

    -- Shortcut: :CC to launch ClaudeCode
    vim.api.nvim_create_user_command("CC", "ClaudeCode", {})
  end,
}

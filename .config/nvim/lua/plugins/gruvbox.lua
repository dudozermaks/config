return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- Load this before all other plugins
    config = function()
      -- Enable true color support
      vim.opt.termguicolors = true
      -- Set contrast: "hard", "medium" (default), or "soft"
      vim.g.gruvbox_contrast_dark = "hard"
      -- Apply the color scheme
      vim.cmd("colorscheme gruvbox")
    end,
  }
}

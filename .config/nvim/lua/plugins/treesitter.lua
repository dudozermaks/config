return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local ts = require("nvim-treesitter")
    
    -- Initialize the plugin
    ts.setup({})

    -- Specify languages you want to automatically install
    ts.install({ "lua", "vim", "vimdoc", "cpp", "rust", "markdown", "python", "javascript" })
  end,
}

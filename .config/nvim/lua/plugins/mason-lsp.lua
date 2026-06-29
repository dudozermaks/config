return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    { "williamboman/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  config = function()
    local servers = {
      -- TypeScript/JavaScript with Vue support
      ts_ls = {
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
        init_options = {
          plugins = {
            {
              name = '@vue/typescript-plugin',
              location = vim.fn.stdpath('data') .. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
              languages = { 'vue' },
            },
          },
        },
      },

      -- Vue language server
      vue_ls = {},
    }

    -- Setup capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- Setup mason-lspconfig with handlers
    require('mason-lspconfig').setup({
      ensure_installed = vim.tbl_keys(servers),
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    })

    -- Ensure ts_ls attaches to Vue files
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'vue',
      callback = function(args)
        local root_dir = vim.fs.root(args.buf, { 'package.json', 'tsconfig.json', 'jsconfig.json' })
        local init_options = vim.deepcopy(servers.ts_ls.init_options)

        local mason_path = vim.fn.stdpath('data') .. '/mason/packages/vue-language-server/node_modules/@vue/language-server'
        if vim.fn.isdirectory(mason_path) == 1 then
          init_options.plugins[1].location = mason_path
        end

        vim.lsp.start({
          name = 'ts_ls',
          cmd = { 'typescript-language-server', '--stdio' },
          root_dir = root_dir,
          init_options = init_options,
          capabilities = capabilities,
        })
      end,
    })
    vim.lsp.config('rust_analyzer', {
      settings = {
        ['rust-analyzer'] = {
          cargo = {
            allTargets = false,
          },
        },
      },
    })

  vim.lsp.enable('rust_analyzer')

  end,
  opts = {
    -- Automatically enables all installed servers
    automatic_enable = true,
  },
}

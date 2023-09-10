return {
  "creativenull/efmls-configs-nvim",
  dependencies = { "VonHeikemen/lsp-zero.nvim" },
  config = function()
    local function on_attach(client)
      print("Attached to " .. client.name)
    end

    local efmls = require("efmls-configs")
    efmls.init({
      -- Your custom attach function
      on_attach = on_attach,

      -- Enable formatting provided by efm langserver
      init_options = {
        documentFormatting = true,
      },

      default_config = true,
    })

    local eslint_d = require("efmls-configs.linters.eslint_d")
    local prettier_d = require("efmls-configs.formatters.prettier_d")
    local golines = require('efmls-configs.formatters.golines')
    golines = vim.tbl_extend('force', golines, {
      formatCommand = 'golines --base-formatter gofumpt'
    })

    efmls.setup({
      javascript = {
        linter = eslint_d,
        formatter = prettier_d,
      },

      typescript = {
        linter = eslint_d,
        formatter = prettier_d,
      },

      go = {
        formatter = golines
      }
    })
  end,
}

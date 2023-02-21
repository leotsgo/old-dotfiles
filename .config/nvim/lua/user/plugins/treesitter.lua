return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    { "p00f/nvim-ts-rainbow" },
    { "nvim-treesitter/nvim-treesitter-context" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
  },
  lazy = false,
  config = function()
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    local context_ok, ts_context = pcall(require, "treesitter-context")
    if not (status_ok or context_ok) then
      return
    end

    configs.setup({
      ensure_installed = "all", -- one of "all" or a list of languages
      auto_install = true,
      ignore_install = { "" }, -- List of parsers to ignore installing
      context_commentstring = { enable = true },
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "css" }, -- list of language that will be disabled
      },
      autopairs = {
        enable = true,
      },
      indent = { enable = true, disable = { "css" } },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },
    })

    ts_context.setup()
  end,
}

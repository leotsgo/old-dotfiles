return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    local status_ok, indent_blankline = pcall(require, "indent_blankline")
    if not status_ok then
      return
    end

    vim.opt.list = true
    vim.opt.listchars:append("space:⋅")

    indent_blankline.setup({
      use_treesitter = true,
      show_current_context = true,
      buftype_exclude = { "terminal", "nofile" },
      filetype_exclude = {
        "help",
        "packer",
        "NvimTree",
      },
      space_char_blankline = " ",
      char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
      },
    })
  end,
}

return {
  "justinmk/vim-sneak",
  lazy = false,
  config = function()
    vim.cmd([[highlight! Sneak guifg=#363A4F guibg=#F5BDE6]])
    vim.cmd([[highlight! SneakScope guibg=#CAD3F5]])
  end,
}

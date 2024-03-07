return {
  'echasnovski/mini.indentscope',
  version = false,
  config = function()
    require('mini.indentscope').setup {
      draw = {
        delay = 50,
      },
    }
  end,
}

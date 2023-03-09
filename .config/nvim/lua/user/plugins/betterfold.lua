return {
  "anuvyklack/pretty-fold.nvim",
  lazy = false,
  config = function()
    local status, pretty_fold = pcall(require, "pretty-fold")
    if not status then
      return
    end

    pretty_fold.setup()
  end,
}

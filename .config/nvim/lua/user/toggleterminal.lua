local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  direction = "horizontal",
  open_mapping = [[<c-\>]],
  size = 20,
})

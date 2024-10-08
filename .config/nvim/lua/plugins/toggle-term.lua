return {
  "akinsho/toggleterm.nvim",
  cmd = "ToggleTerm",
  init = function()
    require("toggleterm").setup({
      open_mapping = [[\\]],
      direction = "horizontal",
      shade_filetypes = {},
      hide_numbers = true,
      insert_mappings = true,
      terminal_mappings = true,
      start_in_insert = true,
      close_on_exit = true,
      size = 20,
    })
  end,
}

return {
  "Saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  opts = {
    completion = {
      crates = {
        enabled = true,
      },
    },
    lsp = {
      enabled = true,
      actions = true,
      completion = true,
      hover = true,
    },
    -- Performance optimizations
    null_ls = {
      enabled = false, -- Disable null-ls integration to avoid conflicts
    },
    popup = {
      autofocus = false, -- Don't autofocus popup to avoid interruptions
    },
  },
}

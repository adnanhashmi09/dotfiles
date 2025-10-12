return {
  "mrcjkb/rustaceanvim",
  version = "^5",
  lazy = false,
  config = function()
    vim.g.rustaceanvim = {
      server = {
        settings = {
          ["rust-analyzer"] = {
            procMacro = {
              enable = true,
            },
            cargo = {
              -- target = "aarch64-unknown-linux-musl",
              allFeatures = true,
            },
          },
        },
      },
    }
  end,
}

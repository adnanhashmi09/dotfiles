return {
  "mrcjkb/rustaceanvim",
  version = "^5",
  lazy = false,
  config = function()
    vim.g.rustaceanvim = {
      server = {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              target = "x86_64-unknown-linux-gnu",
              allFeatures = true,
            },
          },
        },
      },
    }
  end,
}

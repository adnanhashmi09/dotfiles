return {
  "mrcjkb/rustaceanvim",
  version = "^5",
  lazy = false,
  config = function()
    vim.g.rustaceanvim = {
      server = {
        settings = {
          ["rust-analyzer"] = {
            -- Performance optimizations
            procMacro = {
              enable = false, -- Disable for better performance, enable if needed
            },
            cargo = {
              buildScripts = { enable = false },
              target = "aarch64-unknown-linux-musl",
              features = {}, -- Only analyze default features
            },
            -- Additional performance optimizations
            cache = {
              warmup = true, -- Disable cache warmup for faster startup
            },
          },
        },
      },
    }
  end,
}

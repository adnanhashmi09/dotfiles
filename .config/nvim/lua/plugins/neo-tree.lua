return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  opts = {
    sources = { "filesystem", "buffers", "git_status" },
    open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      hide_dotfiles = false,
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          ".git",
          ".DS_Store",
          "node_modules",
          "venv",
          -- 'thumbs.db',
        },
      },
    },
  },
}

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.keymap.set
map("i", "jk", "<ESC>", { desc = "Normal Mode" })
map("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostics in float" })
map("n", "<leader>m", ":Neotree focus<CR>", { desc = "Focus NeoTree", silent = true })

map("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Move to left window including tmux" })
map("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Move to right window including tmux" })
map("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Move to top window including tmux" })
map("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Move to bottom window including tmux" })

vim.keymap.set(
  "n",
  "<leader>gg",
  ":!tmux new-window -c " .. vim.fn.getcwd() .. " -- lazygit <CR><CR>",
  { silent = true }
)
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>ha", function()
  harpoon:list():add()
end)
vim.keymap.set("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<C-p>", function()
  harpoon:list():prev()
end)
vim.keymap.set("n", "<C-n>", function()
  harpoon:list():next()
end)

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table({
        results = file_paths,
      }),
      previewer = conf.file_previewer({}),
      sorter = conf.generic_sorter({}),
    })
    :find()
end

vim.keymap.set("n", "<leader>ht", function()
  toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })

require("which-key").add({
  { "<leader>r", icon = "🦀", group = "Rust" },
  { "<leader>rc", icon = "📦", group = "Crates" },
  { "<leader>rcu", icon = "⬆️", group = "Upgrade crates" },
  { "<leader>rcd", icon = "📚", group = "Crate documentation" },
})

vim.keymap.set("n", "<leader>rcd", function()
  require("crates").open_documentation()
end, {})

vim.keymap.set("n", "<leader>rcu", function()
  require("crates").upgrade_all_crates()
end, {})

return {
  {
    "mfussenegger/nvim-dap",
    desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",
    -- stylua: ignore
    keys = {
      { "<leader>d", "", desc = "+debug", mode = {"n", "v"} },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
      { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
      { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
      { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
      { "<leader>dj", function() require("dap").down() end, desc = "Down" },
      { "<leader>dk", function() require("dap").up() end, desc = "Up" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
      { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
      { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      { "<leader>ds", function() require("dap").session() end, desc = "Session" },
      { "<leader>dT", function() require("dap").terminate() end, desc = "Terminate" },
      -- { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
      -- { "<leader>du", function() require("dap.ui").toggle() end, desc = "Toggle Dap UI" },
    },
  },

  {
    "mfussenegger/nvim-dap-python",
    dependecies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    keys = {
      { "<leader>dt", "", desc = "+debug test", mode = { "n", "v" } },
      {
        "<leader>dtr",
        function()
          require("dap-python").test_method()
        end,
        desc = "Test Method",
      },
      {
        "<leader>dtc",
        function()
          require("dap-python").test_class()
        end,
        desc = "Test Class",
      },
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      -- require("dap-python").test_runner = "pytest"
    end,
  },

  {

    "rcarriga/nvim-dap-ui",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "mfussenegger/nvim-dap",
    },
  -- stylua: ignore
  keys = {
    { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
    { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
  },
    opts = {},
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
    end,
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    dependecies = {
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap",
    },
  },

  { "nvim-neotest/nvim-nio" },
}

return {
  -- Core DAP plugin
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      "nvim-neotest/nvim-nio", -- Required for nvim-dap-ui
    },
    keys = {
      -- F-key bindings
      { "<F5>", function() require("dap").continue() end, desc = "Debug: Start/Continue" },
      { "<F6>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
      { "<F8>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
      { "<F9>", function() require("dap").step_into() end, desc = "Debug: Step Into" },

      -- Breakpoints
      { "<leader>t", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
      {
        "<leader>T",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Debug: Conditional Breakpoint",
      },
    },
  },

  -- Mason integration for auto-installing debug adapters
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    cmd = { "DapInstall", "DapUninstall" },
    opts = {
      ensure_installed = { "python" },
      automatic_installation = true,
      handlers = {}, -- CRITICAL: Required for auto-installation to work
    },
  },

  -- Python debugging support
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      -- Path to Mason-installed debugpy
      local debugpy_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(debugpy_path)

      -- Add custom configurations
      local dap = require("dap")

      -- Configuration for launching with command-line arguments
      table.insert(dap.configurations.python, {
        type = "python",
        request = "launch",
        name = "Launch with arguments",
        program = "${file}",
        args = function()
          local args_string = vim.fn.input("Arguments: ")
          return vim.split(args_string, " +")
        end,
        console = "integratedTerminal",
      })

      -- Configuration to allow stepping into library code
      table.insert(dap.configurations.python, {
        type = "python",
        request = "launch",
        name = "Launch file (debug libraries)",
        program = "${file}",
        justMyCode = false, -- Allow stepping into library code
        console = "integratedTerminal",
      })
    end,
    -- No keybindings to avoid dangerous 'd' prefix
    -- Use dap.configurations to debug tests manually
  },

  -- Visual debugging UI
  {
    "rcarriga/nvim-dap-ui",
    lazy = false, -- Load immediately to ensure it's available
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      -- Setup UI with default configuration
      dapui.setup({
        icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
        mappings = {
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t",
        },
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.25 },
              { id = "breakpoints", size = 0.25 },
              { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.25 },
            },
            size = 40,
            position = "left",
          },
          {
            elements = {
              { id = "repl", size = 0.5 },
              { id = "console", size = 0.5 },
            },
            size = 10,
            position = "bottom",
          },
        },
        floating = {
          max_height = nil,
          max_width = nil,
          border = "single",
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
      })

      -- Auto-open/close UI on debug sessions
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
    -- UI auto-opens, no keybindings needed to avoid dangerous 'd' prefix
  },

  -- Virtual text - shows variable values inline
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
    opts = {
      enabled = true,
      enabled_commands = true,
      highlight_changed_variables = true,
      highlight_new_as_changed = false,
      show_stop_reason = true,
      commented = false,
      only_first_definition = true,
      all_references = false,
      clear_on_continue = false,
      -- Display virtual text at end of line (or 'inline' for nvim 0.10+)
      virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",
      all_frames = false,
      virt_lines = false,
      virt_text_win_col = nil,
    },
  },
}

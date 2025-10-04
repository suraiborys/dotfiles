return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        -- TypeScript/JavaScript
        "ts_ls",
        "eslint",
        -- Python
        "pyright",
        "ruff",
        -- Web
        "html",
        "cssls",
        "tailwindcss",
        -- Lua
        "lua_ls",
      },
      automatic_installation = true,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- formatter
        "stylua", -- lua formatter
        "eslint_d", -- js/ts linter
      },
    })
  end,
}

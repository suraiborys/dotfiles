return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
    "nvim-treesitter/nvim-treesitter",
  },
  event = "BufReadPost",
  opts = {
    provider_selector = function(bufnr, filetype, buftype)
      return { "treesitter", "indent" }
    end,
  },
  init = function()
    -- Folding settings (must be set before ufo loads)
    vim.o.foldcolumn = "0" -- Don't show fold column
    vim.o.foldlevel = 99 -- Open all folds by default
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
}

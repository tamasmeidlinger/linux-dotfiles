return {
  {
    "folke/noice.nvim",
    opts_extend = { "routes" },
    opts = {
      lsp = {
        progress = { enabled = false },
        message = { enabled = false },
      },
      routes = {
        {
          filter = {
            event = "notify",
            find = "mason",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "notify",
            find = "LSP",
          },
          opts = { skip = true },
        },
      },
    },
  },
}

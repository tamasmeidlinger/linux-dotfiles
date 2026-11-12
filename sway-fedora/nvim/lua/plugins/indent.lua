return {
  {
    "folke/snacks.nvim",
    opts = {
      indent = {
        filter = function(buf, win)
          return vim.bo[buf].filetype ~= "markdown"
        end,
      },
    },
  },
}

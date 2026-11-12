return {
  {
    "folke/flash.nvim",
    opts = {
      label = {
        rainbow = {
          enabled = false,
        },
      },
    },
    config = function(_, opts)
      require("flash").setup(opts)

      local function set_flash_highlights()
        local green = "#b6e888" -- brighter Frappé-style green
        local mauve = "#d7a8f2" -- brighter Catppuccin Frappé mauve

        vim.api.nvim_set_hl(0, "FlashLabel", {
          fg = green,
          bg = "NONE",
          bold = true,
        })

        -- FlashMatch and FlashCurrent highlight the found text itself.
        vim.api.nvim_set_hl(0, "FlashMatch", { fg = mauve, bg = "NONE" })
        vim.api.nvim_set_hl(0, "FlashCurrent", { fg = mauve, bg = "NONE" })
      end

      set_flash_highlights()
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = set_flash_highlights,
        desc = "Keep Flash labels and matches green with no background",
      })
    end,
  },
}

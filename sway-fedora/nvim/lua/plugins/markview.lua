-- For `plugins/markview.lua` users.
return {
  "OXY2DEV/markview.nvim",
  lazy = false,

  opts = {

    markdown = {
      list_items = {
        enable = true,
        shift_width = 2,

        marker_dot = {
          add_padding = true,
          conceal_on_checkboxes = true,

          text = function(_, item)
            return string.format("%d.", item.n)
          end,
          hl = "@markup.list.markdown",
        },

        marker_minus = {
          add_padding = true,
          conceal_on_checkboxes = true,

          text = "●",
          hl = "MarkviewListItemMinus",
        },

        marker_star = {
          add_padding = true,
          conceal_on_checkboxes = true,

          text = "◇",
          hl = "MarkviewListItemStar",
        },
      },
    },

    latex = {
      enable = true,

      blocks = {
        enable = true,
      },

      inlines = {
        enable = true,
        padding_left = " ",
        padding_right = " ",

        hl = "MarkviewInlineCode",
      },

      commands = {
        enable = true,
      },

      symbols = {
        enable = true,
      },

      superscripts = {
        enable = true,
      },

      subscripts = {
        enable = true,
      },
    },
  },

  -- Completion for `blink.cmp`
  -- dependencies = { "saghen/blink.cmp" },
}

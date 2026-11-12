return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            typescript = {
              inlayHints = {
                parameterNames = { enabled = false },
                parameterTypes = { enabled = false },
                variableTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                enumMemberValues = { enabled = false },
              },
            },
            javascript = {
              inlayHints = {
                parameterNames = { enabled = false },
                parameterTypes = { enabled = false },
                variableTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                enumMemberValues = { enabled = false },
              },
            },
          },
        },

        gopls = {
          settings = {
            gopls = {
              hints = {
                parameterNames = false,
                assignVariableTypes = false,
                rangeVariableTypes = false,
              },
            },
          },
        },
      },
    },
  },
}

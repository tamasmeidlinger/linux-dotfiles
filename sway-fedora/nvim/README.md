# Neovim

This is a [LazyVim](https://www.lazyvim.org/) configuration with support for
Python, JavaScript, and TypeScript.

## First launch

Open Neovim with `nvim`. LazyVim will install its plugins and the configured
language tools. If prompted, run `:Lazy sync` and restart Neovim.

Python projects use Pyright and Ruff. JavaScript and TypeScript projects use
vtsls, ESLint, and Prettier. Prettier formats on save when available. The
configured tools are managed by Mason; project-local tools and settings are
used where supported.

LazyVim's default keymaps are available from the space-bar leader menu. Use
`<leader>ff` to find files, `<leader>sg` to search project text, and `K` to
show hover documentation. Run `:LazyExtras` to review language extras and
`:Mason` to manage language tools.

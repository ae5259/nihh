-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  version = "^20",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.nix" },
  { import = "astrocommunity.pack.nim" },
  { import = "astrocommunity.pack.zig" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.typescript-deno" },
  { import = "astrocommunity.media.vim-wakatime" },

  { import = "astrocommunity.editing-support.nvim-ts-autotag" },
  { import = "astrocommunity.lsp.ts-error-translator-nvim" },
  { import = "astrocommunity.comment.nvim-ts-context-commentstring" },
  { import = "astrocommunity.pack.tailwindcss" },

  { import = "astrocommunity.colorscheme.gruvbox-baby" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.search.grug-far-nvim" },
  -- import/override with your plugins folder
}

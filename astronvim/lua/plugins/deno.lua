return {
  { "sigmasd/deno-nvim", lazy = true },
  {
    "AstroNvim/astrolsp",
    opts = {
      config = {
        denols = {
          root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc"),
        },
      },
    },
  },
}

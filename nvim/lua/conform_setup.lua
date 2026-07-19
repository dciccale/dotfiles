-- Conform.nvim setup: prefer project-configured Biome, then Prettier.
-- Conform is the sole format-on-save owner; CoC remains responsible for
-- completion and diagnostics.
local conform = require("conform")
local util = require("conform.util")

conform.setup({
  notify_on_error = true,
  notify_no_formatters = false,
  default_format_opts = {
    lsp_format = "never",
    stop_after_first = true,
  },
  format_on_save = { timeout_ms = 3000 },
  formatters_by_ft = {
    javascript = { "biome-check", "prettier" },
    typescript = { "biome-check", "prettier" },
    javascriptreact = { "biome-check", "prettier" },
    typescriptreact = { "biome-check", "prettier" },
    json = { "biome-check", "prettier" },
    jsonc = { "biome-check", "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    markdown = { "prettier" },
    yaml = { "prettier" },
    -- Python: use Black for code formatting
    python = { "black" },
  },
  formatters = {
    ["biome-check"] = {
      condition = util.root_file({ "biome.json", "biome.jsonc", ".biome.json", ".biome.jsonc" }),
    },
    prettier = {
      condition = util.root_file({
        ".prettierrc",
        ".prettierrc.json",
        ".prettierrc.yaml",
        ".prettierrc.yml",
        ".prettierrc.js",
        ".prettierrc.cjs",
        "prettier.config.js",
        "prettier.config.cjs",
        -- Uncomment if you want to detect Prettier in package.json as well:
        -- "package.json",
      }),
    },
  },
})

-- Optional keymap: <leader>cf to format on demand.
pcall(function()
  vim.keymap.set({ "n", "v" }, "<leader>cf", function()
    require("conform").format({ async = true })
  end, { desc = "Format file or range (Conform)" })
end)

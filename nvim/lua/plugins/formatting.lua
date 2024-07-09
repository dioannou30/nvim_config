local M = {}
local Util = require("lazyvim.util")

local function detect_js_formatter()
  local root_files = { "biome.json", ".eslintrc", ".eslintrc.json", ".eslintrc.js" }
  local cwd = vim.fn.getcwd()
  for _, file in ipairs(root_files) do
    if vim.loop.fs_stat(cwd .. "/" .. file) then
      if file:match("biome") then
        return { "biome" }
      elseif file:match("eslint") then
        return { "eslint" }
      end
    end
  end
  return { "prettier" } -- fallback to prettier if neither is found
end

return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cF",
      function()
        require("conform").format({
          formatters = { "injected" },
        })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },
  opts = function()
    local js_formatters = detect_js_formatter()
    ---@class ConformOpts
    local opts = {
      format = {
        timeout_ms = 3000,
        async = false,
        quiet = false,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        javascript = js_formatters,
        javascriptreact = js_formatters,
        typescript = js_formatters,
        typescriptreact = js_formatters,
        css = { "prettier" },
        scss = { "prettier" },
        less = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
        graphql = { "prettier" },
        handlebars = { "prettier" },
      },
      formatters = {
        injected = {
          options = {
            ignore_errors = true,
          },
        },
      },
    }
    return opts
  end,
  config = M.setup,
}

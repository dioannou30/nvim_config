return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    local uv = vim.uv

    -- Function to detect the linter
    local function detect_linter()
      local root_files = { "eslint.config.js", ".eslintrc", ".eslintrc.json", ".eslintrc.js", "biome.json" }
      local cwd = vim.fn.getcwd()
      for _, file in ipairs(root_files) do
        if uv.fs_stat(cwd .. "/" .. file) then
          if file:match("eslint") then
            return "eslint"
          elseif file == "biome.json" then
            return "biomejs"
          end
        end
      end
      return nil
    end

    local detected_linter = detect_linter()
    lint.linters_by_ft = {
      javascript = { detected_linter },
      typescript = { detected_linter },
      javascriptreact = { detected_linter },
      typescriptreact = { detected_linter },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", {
      clear = true,
    })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}

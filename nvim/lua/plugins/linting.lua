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

    -- Set up linters dynamically
    local function setup_linters()
      local detected_linter = detect_linter()
      if detected_linter then
        lint.linters_by_ft = {
          javascript = { detected_linter },
          typescript = { detected_linter },
          javascriptreact = { detected_linter },
          typescriptreact = { detected_linter },
        }
      else
        -- Default to no linter or a fallback linter
        lint.linters_by_ft = {}
      end
    end

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        setup_linters() -- Re-detect linter
        lint.try_lint()
      end,
    })
  end,
}

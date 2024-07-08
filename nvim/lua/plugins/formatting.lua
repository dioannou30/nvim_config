local M = {}
local Util = require("lazyvim.util")
return {
    "stevearc/conform.nvim",
    dependencies = {"mason.nvim"},
    lazy = true,
    cmd = "ConformInfo",
    keys = {{
        "<leader>cF",
        function()
            require("conform").format({
                formatters = {"injected"}
            })
        end,
        mode = {"n", "v"},
        desc = "Format Injected Langs"
    }},

    opts = function()
        local js_formatters = {"biome", "eslint"}

        ---@class ConformOpts
        local opts = {
            -- LazyVim will use these options when formatting with the conform.nvim formatter
            format = {
                timeout_ms = 3000,
                async = false, -- not recommended to change
                quiet = false -- not recommended to change
            },
            -- ---@type table<string, conform.FormatterUnit[]>
            formatters_by_ft = {
                lua = {"stylua"},
                fish = {"fish_indent"},
                ts = {"prettier"},
                ["javascript"] = js_formatters,
                ["javascriptreact"] = js_formatters,
                ["typescript"] = js_formatters,
                ["typescriptreact"] = js_formatters,
                ["css"] = {"prettier"},
                ["scss"] = {"prettier"},
                ["less"] = {"prettier"},
                ["html"] = {"prettier"},
                ["json"] = {"prettier"},
                ["jsonc"] = {"prettier"},
                ["yaml"] = {"prettier"},
                ["markdown"] = {"prettier"},
                ["markdown.mdx"] = {"prettier"},
                ["graphql"] = {"prettier"},
                ["handlebars"] = {"prettier"}
            },
            -- The options you set here will be merged with the builtin formatters.
            -- You can also define any custom formatters here.
            -- -@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
            formatters = {
                injected = {
                    options = {
                        ignore_errors = true
                    }
                }

            }
        }
        return opts
    end,
    config = M.setup
}

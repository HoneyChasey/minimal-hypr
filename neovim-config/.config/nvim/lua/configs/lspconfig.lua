require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls"}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 

--  rust analyser 
-- config lsp for hyprland (so lua lsp)
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "hl" },
            },
            hint = {
                enable = true,
                semicolon = "Disable",
            },
            runtime = {
                version = "LuaJIT",
            },
            workspace = {
                checkThirdParty = false,
                maxPreload    = 1000,
                preloadFileSize = 150,
            },
        },
    },
})

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
        globals = {"vim", "hl"}, 
        },
        workspace = {
          library = {
              vim.fn.expand "$VIMRUNTIME/lua",
              vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
              "/usr/share/hypr/stubs/",
            },
            maxPreload = 100000,
            prelaodFileSize = 100000,
          },
      },
    },
  })

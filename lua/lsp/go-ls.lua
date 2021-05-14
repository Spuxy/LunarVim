require'lspconfig'.gopls.setup{
    cmd = {DATA_PATH .. "/lspinstall/go/gopls","serve"},
    settings = {gopls = {analyses = {unusedparams = true}, staticcheck = true}},
    filetypes = {"go"},
    init_options = {usePlaceholders = true, completeUnimported = true},
    on_attach = require'lsp'.common_on_attach
}

# lsp setup explained

- mason is an installer helper for language servers   
- mason-lspconfig handles some of the integration between mason and lspconfig
- nvim-lsp handles the configuration of lsp servers (it actually IS lspconfig. It is the config plugin for lspconfig)

## process for installing / handling

lsp servers listed [here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) 
are supported (known) by lspconfig. Look here first to find servers to integrate, then install them via Mason.  

If they can't be found on Mason, you can install them manually, but it could get confusing to keep track of.   
It might be more valuable to search for another option via the list above, and check again if availble with Mason.

If installed through Mason, mason-lsp will configure them automatically with its `require('mason-lspconfig').setup_handlers({})` 
call. Otherwise they will need to be setup manually.

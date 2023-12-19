
vim.g.vimwiki_list = { { path = "~/notes/tech", syntax = "markdown", ext = "md" } }
vim.g.vimwiki_global_ext = 1

vim.g.vimwiki_key_mappings = {
  all_maps = 1,
  global = 1,
  headers = 1,
  text_objs = 1,
  table_format = 1,
  table_mappings = 1,
  lists = 0, -- dissable <c-l> list keybinds
  links = 1,
  html = 1,
  mouse = 0,
}

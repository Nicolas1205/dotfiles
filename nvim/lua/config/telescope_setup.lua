local map = require('config.utils').map

local silent= {silent = true}

map('n', '<leader>,', [[<cmd>Telescope buffers show_all_buffers=true theme=get_ivy<cr>]], silent)
--map('n', '<leader><leader>', [[<cmd>Telescope frecency theme=get_ivy<cr>]], silent)
map('n', '<leader>fg', [[<cmd>Telescope git_files theme=get_ivy<cr>]], silent)
map('n', '<leader><leader>', [[<cmd>Telescope find_files theme=get_ivy<cr>]], silent)
map('n', '<leader>y', [[<cmd>Telescope live_grep theme=get_ivy<cr>]], silent)
-- map('n',  '<leader>fb' , [[<cmd> Telescope file_browser <cr>]] ,silent)
map('n', '<leader>pp' , [[<cmd> Telescope project<cr>]], silent )
map('n', '<leader>:' , [[<cmd> Telescope commands<cr>]], silent )
map('n', '<leader>fs' , [[<cmd> Telescope grep_string<cr>]], silent )
map('n', '<leader>qf' , [[<cmd> Telescope quickfix<cr>]], silent )
map('n', '<leader>fr' , [[<cmd> Telescope oldfiles<cr>]], silent )
map('n', '<leader>pp' , [[<cmd> Telescope project<cr>]], silent )
map('n', '<leader>s' , [[<cmd> Telescope current_buffer_fuzzy_find<cr>]], silent )
map('n', '<leader>cx' , [[<cmd> Telescope lsp_document_diagnostics<cr>]], silent )
map('n', '<leader>ts' , [[<cmd> Telescope treesitter<cr>]], silent )
map('n', '<leader>.' , [[<cmd> Telescope file_browser<cr>]])

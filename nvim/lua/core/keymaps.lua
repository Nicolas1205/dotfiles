local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then 
    options = vim.tbl_extend('force', options, opts) 
  end 
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- MISC
map('n', '<leader>r', ':so %<CR>')

map('n', '<leader>s', ':w<CR>')
map('n', '<leader>q', ':qa!<CR>')
map('n', '<leader>le', ':Trouble<CR>')


-- == MOVEMENTS == --

map(
  "n",
  "<a-j>",
  ":m .+1<CR>==",
  opts,
  "Editor",
  "normal_move_line_down",
  "Normal Move line down"
)
map(

  "n",
  "<a-k>",
  ":m .-2<CR>==",
  opts,
  "Editor",
  "normal_move_line_up",
  "Normal Move line up"
)

map(
  "i",
  "<a-j>",
  "<esc>:m .+1<CR>==gi",
  opts,
  "Editor",
  "instert_move_line_down",
  "Insert Move line down"
)

map(
  "v",
  "<a-j>",
  ":m '>+1<CR>gv=gv",
  opts,
  "Editor",
  "visual_move_line_down",
  "Visual Move line down"
)
map(
  "v",
  "<a-k>",
  ":m '<-2<CR>gv=gv",
  opts,
  "Editor",
  "visual_move_line_up",
  "Visual Move line up"
)

map(
  "t",
  "<leader><Esc>",
  "<C-\\><C-n>",
  opts,
  "Editor",
  "exit_insert_term",
  "Exit insert mode (inside a terminal)"
)


map('n', '<leader>c', ':nohl<CR>')
map('n', '<leader>wh', '<C-w>h')
map('n', '<leader>wj', '<C-w>j')
map('n', '<leader>wk', '<C-w>k')
map('n', '<leader>wl', '<C-w>l')
map('n', "<leader>ww", "<C-w>p")
map("n", "<leader>wq", "<C-W>c")
map("n", "<leader>wJ", "<C-W>s", opts, "Window", "split_below", "Split window below")
map("n", "<leader>wL", "<C-W>v", opts, "Window", "split_right", "Split window right")


-- === TELESCOPE === --



map(
  "n",
  "<leader>,",
  "<cmd>Telescope buffers show_all_buffers=true<CR>",
  opts,
  "Movement",
  "switch_buffers",
  "Switch buffers"
)

map(
  "n",
  "<leader>:",
  "<cmd>Telescope commands<CR>",
  opts,
  "Editor",
  "command_history",
  "Command history"
)

map(
  "n",
  "<leader>ff",
  "<cmd>Telescope find_files<CR>",
  opts,
  "Editor",
  "find_files_alt",
  "Find files"
)

map(
  "n",
  "<leader>fr",
  "<cmd>Telescope oldfiles<CR>",
  opts,
  "Editor",
  "recent_files",
  "Recently opened files"
)


map(
  "n", 
  "<leader>.", 
  ":Telescope file_browser<CR>", 
  {noremap = true}
)


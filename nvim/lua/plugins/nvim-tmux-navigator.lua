return {
  "christoomey/vim-tmux-navigator",
  dependencies = {
    "preservim/vimux",
  },
  vim.keymap.set('n', '<C-h>', ':TmuxNavigateLeft<CR>'),
  vim.keymap.set('n', '<C-j>', ':TmuxNavigateDown<CR>'),
  vim.keymap.set('n', '<C-k>', ':TmuxNavigateUp<CR>'),
  vim.keymap.set('n', '<C-l>', ':TmuxNavigateLeft<CR>'),
  vim.cmd("let test#strategy = 'vimux'")
}

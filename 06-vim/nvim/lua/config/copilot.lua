local suggestion = require('copilot.suggestion')
local panel = require('copilot.panel')

local map = vim.keymap.set

map('n', '<leader>ca', panel.accept)
map('n', '<leader>cn', panel.jump_next)
map('n', '<leader>cp', panel.jump_prev)
map('n', '<leader>tc', suggestion.toggle_auto_trigger)
map('i', '<C-a>', suggestion.accept_word)
map('i', '<C-S-a>', suggestion.accept_line)
map('i', '<C-n>', suggestion.next)
map('i', '<C-p>', suggestion.prev)
map('i', '<C-c>', suggestion.dismiss)

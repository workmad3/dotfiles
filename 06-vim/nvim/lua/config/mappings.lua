local map = vim.keymap.set

-- Buffer Nav
map('n', '<leader>bn', vim.cmd.bnext, { desc = "Next buffer" })
map('n', '<leader>bp', vim.cmd.bprev, { desc = "Previous buffer" })

-- Window Nav
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-j>', '<C-w>j')

-- Preserve visual in indent
map('v', '<', '<gv', { desc = "Unindent highlighted code" })
map('v', '>', '>gv', { desc = "Indent highlighted code" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- Telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "telescope find all files" }
)

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
	vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- LSP
map('n', 'gD', vim.lsp.buf.declaration, { silent = true, desc = "Goto declaration" })
map('n', 'gd', vim.lsp.buf.definition, { silent = true, desc = "Goto definition" })
map('n', 'gi', vim.lsp.buf.implementation, { silent = true, desc = "Goto implementation" })
map('n', 'gr', vim.lsp.buf.references, { silent = true, desc = "List references" })
map('n', 'go', vim.lsp.buf.type_definition, { desc = "Goto type definition" })
map('n', 'gs', vim.lsp.buf.signature_help, { silent = true, desc = "Show signature" })
map('n', 'K', vim.lsp.buf.hover, { silent = true, desc = "Show info" })
map('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename" })
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Run code action" })
map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { silent = true, desc = "Add folder to workspace" })
map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { silent = true, desc = "Remove folder from workspace" })
map('n', '<leader>wl', function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "List workspace folders" })

map('n', 'gl', vim.diagnostic.open_float)
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)

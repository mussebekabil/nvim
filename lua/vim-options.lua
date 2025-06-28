vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard=unnamed")
vim.g.mapleader = " "

-- Gemini Code Assistant and the Gemini CLI
local keymap = vim.keymap

-- Ask a general question and open the output in a new split window
keymap.set("n", "<leader>ga", function()
  local prompt = vim.fn.input("Gemini: ")
  if prompt ~= "" then
    vim.cmd("vsplit")
    vim.cmd("enew")
    vim.cmd("set buftype=nofile")
    vim.cmd('read !gemini "' .. prompt .. '"')
  end
end, { desc = "[G]emini [A]sk" })

-- Refactor visually selected code in place
keymap.set("v", "<leader>gr", ':<C-U>!gemini "refactor this code:"<CR>', { desc = "[G]emini [R]efactor" })

-- Explain visually selected code in a new split
keymap.set("v", "<leader>ge", ':<C-U>w !gemini "explain this code:"<CR>', { desc = "[G]emini [E]xplain" })


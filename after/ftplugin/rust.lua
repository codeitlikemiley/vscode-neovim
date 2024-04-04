local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n",
  "<D-r>",
  function()
    vim.cmd.RustLsp { 'testables', bang = true }
  end,
  { silent = true, buffer = bufnr }
)
vim.keymap.set(
  "n",
  "<D-d>",
  function()
    vim.cmd.RustLsp('testables')
  end,
  { silent = true, buffer = bufnr }
)

return -- LSP keymaps
{
    "neovim/nvim-lspconfig",
    opts = {
    },
    -- modify lsp keymaps
    init = function()
        local keys = require("lazyvim.plugins.lsp.keymaps").get()
        local bufnr = vim.api.nvim_get_current_buf()

        if vim.fn.has("macunix") == 1 and vim.fn.exists("neovide") == 1 or vim.fn.has("gui_running") == 1 then
            keys[#keys + 1] =
            { "<D-.>", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v", "i" }, has = "codeAction" }
            -- disable default keymap of CMD + r
            keys[#keys + 1] = { "<D-r>", false }
            --- We need to inject here our Cargo Runner

            keys[#keys + 1] = { "<F2>", vim.lsp.buf.rename, desc = "Rename", mode = { "n", "v", "i" }, has = "rename" }
            keys[#keys + 1] = {
                "<D-k>",
                ':lua require("dap").continue()<CR>',
                desc = "Debug Continue",
                mode = { "n", "v", "i" },
                has =
                "Debug Continue"
            }
        else
            keys[#keys + 1] =
            { "<C-.>", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v", "i" }, has = "codeAction" }
            keys[#keys + 1] = { "<F2>", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
        end

        -- end modifying lsp keymaps
    end,
    --  Modify other LSP  settings below this line
}

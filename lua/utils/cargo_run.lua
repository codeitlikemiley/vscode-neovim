local vscode = require('vscode-neovim')

local get_makefile = require("utils.cargo").get_makefile
local is_file_in_test_context = require("utils.cargo").is_file_in_test_context
local check_crate_type = require("utils.cargo").check_crate_type
local get_package = require("utils.cargo").get_package
local get_bin = require("utils.cargo").get_bin
local cargo_nextest = require("utils/cargo_nextest")

function cargo_run()
    local bufnr = vim.api.nvim_get_current_buf()
    local file_path = vim.api.nvim_buf_get_name(bufnr)
    local makefile_path = get_makefile(file_path)
    local makefile_valid = is_makefile_valid(makefile_path)
    local is_test_context = is_file_in_test_context()
    local crate_type = check_crate_type(file_path)
    local package_name = get_package(file_path) or vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    local bin_name = get_bin(file_path)
    local test_fn_name = get_test_name()

    print("----------------------------------------------------------")
    print("makefile_path: " .. (makefile_path or "nil"))
    print("makefile_valid: " .. (makefile_valid and "true" or "false"))
    print("is_test_context: " .. (is_test_context and "true" or "false"))
    print("crate_type: " .. (crate_type or "nil"))
    print("package_name: " .. (package_name or "nil"))
    print("bin_name: " .. (bin_name or "nil"))
    print("test_fn_name: " .. (test_fn_name or "nil"))
    print("----------------------------------------------------------")

    -- Determine command based on context
    local cmd
    local makefile_dir = makefile_path and vim.fn.fnamemodify(makefile_path, ":h") or nil
    if is_test_context then
        cmd = cargo_nextest(package_name ,bin_name)
    elseif makefile_valid then
        if crate_type == "bin" then
            cmd = "make -C " .. makefile_dir .. " run"
        elseif crate_type == "build" then
            cmd = "make -C " .. makefile_dir .. " build"
        else
            print("Cannot run makefile for current opened file.")
            return
        end
    else
        if crate_type == "bin" then
            cmd = "cargo run -p " .. package_name .. (bin_name and (" --bin " .. bin_name) or "")
        elseif crate_type == "build" then
            cmd = "cargo build -p " .. package_name
        else
            print("Cannot run cargo commands for current opened file.")
            return
        end
    end

    -- Use VSCodeNotify to open a terminal in VSCode and run the command
    vscode.action('workbench.action.terminal.new')

    -- Use a delay before sending the command to ensure the terminal is ready
    vscode.action('workbench.action.terminal.sendSequence', { args = ({ text = cmd .. '\r' }) })
end

return cargo_run

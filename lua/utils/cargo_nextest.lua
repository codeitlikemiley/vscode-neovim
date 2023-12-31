local vscode = require('vscode-neovim')
local check_crate_type = require("utils.cargo").check_crate_type
local get_test_name = require("utils.get_test_name")

function cargo_nextest(package, bin_name)
  local bufnr = vim.api.nvim_get_current_buf()
  local file_path = vim.api.nvim_buf_get_name(bufnr)
  local crate_type = check_crate_type(file_path)
  local test_fn_name = get_test_name()


  -- Determine if inside a test function
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local inside_test_function = false
  for _, line in ipairs(lines) do
    if line:find("#%[test%]") or line:find("#%[tokio::test%]") then
      inside_test_function = true
      break
    end
  end

  local cmd


  if inside_test_function then
    if crate_type == "bin" then
      cmd = "cargo nextest run -p " .. package .. " --bin " .. bin_name
      if test_fn_name then
        cmd = cmd .. " -- " .. "tests::"..test_fn_name
      end
    elseif crate_type == "lib" then
      cmd = "cargo nextest run -p " .. package
      if test_fn_name then
        cmd = cmd .. " -- " .. "tests::"..test_fn_name
      end
    else
      print("Unsupported crate type for test context.")
      return
    end
  else
    print("Not inside a test function.")
    return
  end

  return cmd
end

return cargo_nextest

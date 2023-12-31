function get_test_name()
    local cursor_line, _ = unpack(vim.api.nvim_win_get_cursor(0))
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

    for i = 1, #lines do
        if lines[i]:find("#%[test%]") or lines[i]:find("#%[tokio::test%]") then
            if cursor_line >= i then
                local function_line = lines[i + 1]
                local fn_index = function_line:find("fn ")
                if fn_index then
                    local function_name_start = fn_index + 3
                    local function_name_end = function_line:find("%(", function_name_start)
                    if function_name_end then
                        function_name_end = function_name_end - 1
                        local test_function_name = function_line:sub(function_name_start, function_name_end)
                        local brace_count = 0

                        for j = i + 1, #lines do
                            brace_count = brace_count + select(2, lines[j]:gsub("{", "{")) - select(2, lines[j]:gsub("}", "}"))
                            if brace_count == 0 and cursor_line <= j then
                                return test_function_name:match("^%s*(%S+)")
                            end
                        end
                    end
                end
            end
        end
    end
    return nil
end

return get_test_name

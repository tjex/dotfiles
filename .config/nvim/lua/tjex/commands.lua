-- custom commands (run from :commandline)
local usr_cmd = vim.api.nvim_create_user_command
local auto = vim.api.nvim_create_autocmd
local funcs = require "tjex.funcs"

-- 
-- auto commands
--

-- auto("BufWritePre", { callback = funcs.format })
auto({ "VimEnter" }, { callback = funcs.open_tree_on_dir })

-- writes output of go programs to set buffnr
local attach_to_buffer = function(output_bufnr, pattern, command)
    auto("BufWritePost", {
        group = vim.api.nvim_create_augroup("go", { clear = true }),
        pattern = pattern,
        callback = function()
            local append_data = function(_, data)
                if data then
                    vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
                end
            end
            vim.api.nvim_buf_set_lines(output_bufnr, 0, -1, false, { "output of main.go:" })
            vim.fn.jobstart(command, {
                stdout_buffered = true,
                on_stdout = append_data,
                on_stderr = append_data,
            })
        end,
    })
end

--
-- user commands
--
usr_cmd("AutoRun", function()
    print "AutoRun starts now..."
    -- local bufnr = vim.cmd(":echo nvim_get_current_buf()")
    local bufnr = vim.fn.input "Bufnr: "
    local pattern = vim.fn.input "Pattern: "
    local command = vim.split(vim.fn.input "Command: ", " ")
    attach_to_buffer(tonumber(bufnr), pattern, command)
end, {})

usr_cmd("Date", "norm! i " .. vim.fn.strftime "%Y-%m-%d", {})
usr_cmd("PubDate", "norm! i " .. vim.fn.strftime "%Y-%m-%dT%XZ", {})
usr_cmd("Dapui", ":lua require('dapui').toggle()<CR>", {})
usr_cmd("Cs", ":lua require('telescope.builtin').find_files({cwd='~/tjroot/dev/cheat-sheets'})<CR>", {})
usr_cmd("Conf", ":lua require('telescope.builtin').find_files({cwd='~/.config/nvim/lua/tjex', previewer=false})<CR>", {})
usr_cmd("EditSnippets", ":lua require('luasnip.loaders').edit_snippet_files()<CR>", {})
usr_cmd("Chmod", ":!chmod +x %<CR>", {})
usr_cmd("W", ":w<CR>", {}) -- sometimes I type :w too fast, and it becomes :W (which gives an error and breaks da flow yo)

local ok, _ = pcall(require, "telescope")
if not ok then
    print('telescope not ok!')
    return
end

require('telescope').setup {
    defaults = {
        -- preview = false,

        path_display     = { 'truncate' },
        results_title    = '',
        sorting_strategy = 'ascending',
        layout_strategy  = 'horizontal',
        layout_config    = {
            horizontal = {
                prompt_position = 'top',
                height = 0.8,
                width = 0.8,
                preview_cutoff = 100,
            }
        },
    },
    pickers = {
        find_files = {
            previewer = false,
        },
        live_grep = {
            previewer = false,
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        },
        recent_files = {
            only_cwd = true,
        }
    },
}

-- load the extensions
require('telescope').load_extension('fzf')
--require('telescope').load_extension('dap')

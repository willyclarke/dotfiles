local state = {
    floating = {
        buf = -1,
        win = -1,
    }
}

local function create_floating_window(opts)
    opts = opts or {}

    -- Get the current screen size
    local ui = vim.api.nvim_list_uis()[1]
    local screen_width = ui.width
    local screen_height = ui.height

    -- Default width and height (80% of screen size)
    local default_width = math.floor(screen_width * 0.8)
    local default_height = math.floor(screen_height * 0.8)

    -- Use provided width and height or fallback to defaults
    local width = opts and opts.width or default_width
    local height = opts and opts.height or default_height

    -- Calculate the centered position
    local col = math.floor((screen_width - width) / 2)
    local row = math.floor((screen_height - height) / 2)

    -- Create a buffer
    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true) -- no file, scratch buffer
    end

    -- Configure the window options
    local win_config = {
        relative = "editor", -- Position relative to the entire editor
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal", -- Minimal style (no borders, no title bar)
        border = "rounded", -- Optional: Add rounded borders
    }

    -- Create the floating window
    local win = vim.api.nvim_open_win(buf, true, win_config)

    return { buf = buf, win = win }
end

local function toggle_terminal()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = create_floating_window { buf = state.floating.buf }
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.terminal()
        end
        -- Go directly to insert mode
        vim.cmd("startinsert")
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
end

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})
vim.api.nvim_set_keymap("n", "<leader>t", ":Floaterminal<CR>", { noremap = true })
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

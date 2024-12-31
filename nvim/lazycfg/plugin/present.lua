local M = {}

M.setup = function()
  -- nothing yet
end

---@class present.Slides
---@fields slides string[]: The slides of the file

--- Takes some lines and parses them
--- @param lines string[]: The lines in the buffer
--- @return present.Slides
local parse_slides = function(lines)
  local slides = { slides = {} }
  local current_slide = {}
  local separator = "^#"

  for _, line in ipairs(lines) do
    print(line, "find:", line:find(separator), "|")
    if line:find(separator) then
      if #current_slide > 0 then
        table.insert(slides.slides, current_slide)
      end
      current_slide = {}
    end

    table.insert(current_slide, line)
  end
  table.insert(slides.slides, current_slide)

  return slides
end

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
  local buf = vim.api.nvim_create_buf(false, true) -- no file, scratch buffer

  -- Configure the window options
  local win_config = {
    relative = "editor", -- Position relative to the entire editor
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",  -- Minimal style (no borders, no title bar)
    border = "rounded", -- Optional: Add rounded borders
  }

  -- Create the floating window
  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end

M.start_presentation = function(opts)
  opts = opts or {}
  opts.bufnr = opts.bufnr or 0

  local lines = vim.api.nvim_buf_get_lines(opts.bufnr, 0, -1, false)
  local parsed = parse_slides(lines)
  local float = create_floating_window()

  local current_slide = 1
  -- Set up local keymaps for slide show.
  vim.keymap.set("n", "n",
    function()
      current_slide = math.min(current_slide + 1, #parsed.slides)
      vim.api.nvim_buf_set_lines(float.buf, 0, -1, false, parsed.slides[current_slide])
    end, { buffer = float.buf }
  )

  vim.keymap.set("n", "p",
    function()
      current_slide = math.max(current_slide - 1, 1)
      vim.api.nvim_buf_set_lines(float.buf, 0, -1, false, parsed.slides[current_slide])
    end, { buffer = float.buf }
  )

  vim.keymap.set("n", "q", function() vim.api.nvim_win_close( float.win, true ) end, { buffer = float.buf })

  vim.api.nvim_buf_set_lines(float.buf, 0, -1, false, parsed.slides[1])
end

---
--- for test purpose 
--- use :echo nvim_get_curr_buf()
--- and then use the buffer number to start the presentation.
-- M.start_presentation { bufnr = 3 }
--
-- vim.print(parse_slides {
--   "#Hello",
--   "this is something else",
--   "#World",
--   "this is another thing",
-- })

return M

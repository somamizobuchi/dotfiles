-- floaterm.lua
-- Persistent floating terminal using Neovim's :terminal (correct implementation)

local M = {}

-- Internal state
local state = {
  buf = nil,
  win = nil,
}

-- Configuration
local config = {
  width = 0.8,     -- percentage of editor width
  height = 0.8,    -- percentage of editor height
  border = "rounded",
}

-- Helpers
local function is_buf_valid()
  return state.buf and vim.api.nvim_buf_is_valid(state.buf)
end

local function is_win_valid()
  return state.win and vim.api.nvim_win_is_valid(state.win)
end

local function get_float_opts()
  local ui = vim.api.nvim_list_uis()[1]
  if not ui then return nil end

  local width = math.floor(ui.width * config.width)
  local height = math.floor(ui.height * config.height)

  return {
    relative = "editor",
    width = width,
    height = height,
    col = math.floor((ui.width - width) / 2),
    row = math.floor((ui.height - height) / 2),
    style = "minimal",
    border = config.border,
  }
end

-- Create terminal buffer INSIDE the floating window
local function create_terminal()
  local opts = get_float_opts()
  if not opts then return end

  -- Create empty scratch buffer
  state.buf = vim.api.nvim_create_buf(false, true)
  vim.bo[state.buf].bufhidden = "hide"
  vim.bo[state.buf].buflisted = false
  vim.bo[state.buf].swapfile = false

  -- Open floating window and make it current
  state.win = vim.api.nvim_open_win(state.buf, true, opts)

  -- IMPORTANT: terminal must be started while this window is current
  vim.cmd("terminal")

  -- :terminal replaces the buffer, so capture it
  state.buf = vim.api.nvim_get_current_buf()

  vim.cmd("startinsert")
end

-- Open terminal window
function M.open()
  -- If window already exists, just focus it
  if is_win_valid() then
    vim.api.nvim_set_current_win(state.win)
    vim.cmd("startinsert")
    return
  end

  -- If terminal buffer doesn't exist, create everything
  if not is_buf_valid() then
    create_terminal()
    return
  end

  -- Reopen existing terminal buffer in a new floating window
  local opts = get_float_opts()
  if not opts then return end

  state.win = vim.api.nvim_open_win(state.buf, true, opts)
  vim.cmd("startinsert")
end

-- Close floating window (keep terminal alive)
function M.close()
  if is_win_valid() then
    vim.api.nvim_win_close(state.win, true)
    state.win = nil
  end
end

-- Toggle visibility
function M.toggle()
  if is_win_valid() then
    M.close()
  else
    M.open()
  end
end

-- Optional setup
function M.setup(opts)
  config = vim.tbl_deep_extend("force", config, opts or {})
end

return M

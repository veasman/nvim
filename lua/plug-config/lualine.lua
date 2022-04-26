local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local colors = require("gruvbox-baby.colors").config()

local mode_color = {
  n = colors.blue_gray,
  i = colors.soft_green,
  v = colors.orange,
  V = colors.orange,
  c = colors.magenta,
  no = colors.red,
  s = colors.orange,
  S = colors.orange,
  [''] = colors.orange,
  ic = colors.yellow,
  R = colors.red,
  Rv = colors.violet,
  cv = colors.red,
  ce = colors.red,
  r = colors.cyan,
  rm = colors.cyan,
  ['r?'] = colors.cyan,
  ['!'] = colors.red,
  t = colors.red,
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local config = {
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '|', right = '|' },
    theme = {
      normal = {
        a = { fg = colors.foreground, bg = colors.background_dark },
        b = { fg = colors.foreground, bg = colors.background_dark },
        c = { fg = colors.foreground, bg = colors.background_dark },
        x = { fg = colors.foreground, bg = colors.background_dark },
        y = { fg = colors.foreground, bg = colors.background_dark },
        z = { fg = colors.foreground, bg = colors.background_dark }
      },
      inactive = {
        a = { fg = colors.foreground, bg = colors.background_dark },
        b = { fg = colors.foreground, bg = colors.background_dark },
        c = { fg = colors.foreground, bg = colors.background_dark },
        x = { fg = colors.foreground, bg = colors.background_dark },
        y = { fg = colors.foreground, bg = colors.background_dark },
        z = { fg = colors.foreground, bg = colors.background_dark }
      },
    },
  },
  sections = {
    lualine_a = {
      {
        "mode",
        function(str)
          return str
        end,
        color = function()
          return { bg = mode_color[vim.fn.mode()], fg = colors.background_dark }
        end,
        padding = { left = 1, right = 1 },
      },
    },
    lualine_b = {
      {
        'branch',
        icon = '',
        color = { bg = colors.bg_light, fg = colors.comment },
      },
    },
    lualine_c = {
      {
        'filename',
        cond = conditions.buffer_not_empty,
        color = { fg = colors.comment },
      },
      {
        'diff',
        symbols = { added = ' ', modified = ' ', removed = ' ' },
        diff_color = {
          added = { fg = colors.soft_green },
          modified = { fg = colors.orange },
          removed = { fg = colors.red },
        },
        cond = conditions.hide_in_width,
      },
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ' },
        diagnostics_color = {
          color_error = { bg = colors.red },
          color_warn = { bg = colors.yellow },
          color_info = { bg = colors.cyan },
        },
      },
    },
    lualine_x = {
    },
    lualine_y = {
      {
        'encoding',
        color = { fg = colors.comment },
      },
      {
        'fileformat',
        color = { fg = colors.comment },
      },
      {
        'filetype',
        icons_enabled = true,
        color = { fg = colors.comment },
      },
    },
    lualine_z = {
      {
        'location',
        color = function()
          return { bg = mode_color[vim.fn.mode()], fg = colors.background_dark }
        end,
      },
    },
  },
}

lualine.setup(config)

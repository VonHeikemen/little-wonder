local color = {
  white   = {gui = '#FBFBFB', cterm = 15 },
  black   = {gui = '#403F53', cterm = 238},
  green   = {gui = '#4E7240', cterm = 239},
  blue    = {gui = '#4876D6', cterm = 68 },
  cyan    = {gui = '#0C969B', cterm = 30 },
  red     = {gui = '#BC5454', cterm = 131},
  magenta = {gui = '#994CC3', cterm = 97 },
  yellow  = {gui = '#C96765', cterm = 167},

  gray             = {gui = '#989FB1', cterm = 247},
  light_cyan       = {gui = '#93A1A1', cterm = 247},
  smoke_white      = {gui = '#F0F0F0', cterm = 254},
  gainsboro_white  = {gui = '#E0E0E0', cterm = 254},
  darkness         = {gui = '#CECECE', cterm = 252},
  dim_gray         = {gui = '#CBCBCB', cterm = 251},
  whiteee          = {gui = '#EEEEEE', cterm = 254},
  bright_black     = {gui = '#5F6672', cterm = 242},
  pink             = {gui = '#FF2C83', cterm = 198},
}

local theme = function()
  return {
    globals = {
      type = 'light',
      foreground = color.black,
      background = color.white,
    },
    syntax = {
      comment  = color.green,
      string   = color.yellow,
      constant = color.red,
      storage  = color.blue,
      special  = color.light_cyan,
      error    = color.pink,
      error_bg = nil
    },
    ui = {
      cursorline    = color.smoke_white,
      selection     = color.gainsboro_white,
      colorcolumn   = color.smoke_white,
      dark_text     = color.gray,
      line_nr       = color.gray,
      line_bg       = color.darkness,
      folds         = color.bright_black,
      menu_item     = color.whiteee,
      menu_selected = color.dim_gray,
      search        = color.light_cyan,
      matchparen    = color.magenta,
      info          = color.cyan,
      warning       = color.yellow,
      error         = color.red
    },
    terminal = {
      white        = color.white.gui,
      bright_white = color.whiteee.gui,
      black        = color.black.gui,
      red          = color.red.gui,
      green        = color.green.gui,
      blue         = color.blue.gui,
      magenta      = color.magenta.gui,
      yellow       = color.yellow.gui,
      cyan         = color.cyan.gui,
    },
  }
end

local update = function(override)
  return vim.tbl_deep_extend(
    'force',
    theme(),
    override or {}
  )
end

return {
  get = theme,
  update = update,
  palette = function() return color end
}


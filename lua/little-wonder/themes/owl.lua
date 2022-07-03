local color = {
  white   = {gui = '#D6DEEB', cterm = 253},
  black   = {gui = '#011627', cterm = 238},
  green   = {gui = '#98C379', cterm = 108},
  blue    = {gui = '#82AAFF', cterm = 111},
  cyan    = {gui = '#56B6C2', cterm = 73 },
  red     = {gui = '#FF869A', cterm = 210},
  magenta = {gui = '#C792EA', cterm = 139},
  yellow  = {gui = '#ECC48D', cterm = 222},

  bright_black = {gui = '#5F6672', cterm = 242},
  bright_white = {gui = '#D4D7D9', cterm = 188},
  pink         = {gui = '#FF2C83', cterm = 198},
  pale_yellow  = {gui = '#FFEB95', cterm = 222},

  gray      = {gui = '#8893A6', cterm = 103},
  dark_blue = {gui = '#01121F', cterm = 237},
  sad_blue  = {gui = '#1D3B53', cterm = 237},
  pale_blue = {gui = '#0E2232', cterm = 235},
  live_blue = {gui = '#3E4E5B', cterm = 239},
  darkness  = {gui = '#17223C', cterm = 234},
}

local theme = function()
  return {
    globals = {
      type = 'dark',
      foreground = color.white,
      background = color.black,
    },
    syntax = {
      comment  = color.red,
      string   = color.pale_yellow,
      constant = color.magenta,
      storage  = color.blue,
      special  = color.gray,
      error    = color.pink,
      error_bg = nil
    },
    ui = {
      cursorline    = color.dark_blue,
      selection     = color.sad_blue,
      colorcolumn   = color.dark_blue,
      dark_text     = color.gray,
      line_nr       = color.gray,
      line_bg       = color.darkness,
      folds         = color.bright_black,
      menu_item     = color.pale_blue,
      menu_selected = color.live_blue,
      search        = color.magenta,
      matchparen    = color.yellow,
      info          = color.cyan,
      warning       = color.yellow,
      error         = color.red
    },
    terminal = {
      white        = color.white.gui,
      bright_white = color.bright_white.gui,
      black        = color.black.gui,
      bright_black = color.bright_black.gui,
      red          = color.red.gui,
      green        = color.green.gui,
      blue         = color.blue.gui,
      magenta      = color.magenta.gui,
      yellow       = color.pale_yellow.gui,
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


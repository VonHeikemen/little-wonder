local color = {
  white   = {gui = '#D8DEE9', cterm = 253},
  black   = {gui = '#343D46', cterm = 237},
  green   = {gui = '#99C794', cterm = 114},
  blue    = {gui = '#6699CC', cterm = 111},
  cyan    = {gui = '#5FB4B4', cterm = 73 },
  red     = {gui = '#EC5F66', cterm = 203},
  magenta = {gui = '#C695C6', cterm = 176},
  yellow  = {gui = '#FFCB6B', cterm = 221},

  orange         = {gui = '#F9AE58', cterm = 215},
  gray           = {gui = '#A6ACB9', cterm = 145},
  bright_gray    = {gui = '#46505B', cterm = 239},
  dark_gray      = {gui = '#2F353C', cterm = 235},
  light_gray     = {gui = '#939393', cterm = 238},
  dark_blue      = {gui = '#4E5A65', cterm = 240},
  charcoil       = {gui = '#3D4751', cterm = 239},
  dim_gray       = {gui = '#62686F', cterm = 242},
  silver         = {gui = '#B0AEB0', cterm = 145},
  bright_yellow  = {gui = '#F2CA27', cterm = 220},
}

local theme = function()
  return {
    globals = {
      type = 'dark',
      foreground = color.white,
      background = color.black,
    },
    syntax = {
      comment  = color.gray,
      string   = color.green,
      constant = color.orange,
      storage  = color.blue,
      special  = color.cyan,
      error    = color.red,
      error_bg = nil
    },
    ui = {
      cursorline    = color.bright_gray,
      selection     = color.bright_gray,
      colorcolumn   = color.dark_blue,
      dark_text     = color.silver,
      line_nr       = color.light_gray,
      line_bg       = color.charcoil,
      folds         = color.dim_gray,
      menu_item     = color.dark_gray,
      menu_selected = color.dim_gray,
      search        = color.bright_yellow,
      matchparen    = color.yellow,
      info          = color.cyan,
      warning       = color.yellow,
      error         = color.red
    },
    terminal = {
      white   = color.white.gui,
      black   = color.black.gui,
      red     = color.red.gui,
      green   = color.green.gui,
      blue    = color.blue.gui,
      magenta = color.magenta.gui,
      yellow  = color.orange.gui,
      cyan    = color.cyan.gui,
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
  update = update
}


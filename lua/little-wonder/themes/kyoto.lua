local color = {
  white   = {gui = '#C0CAF5', cterm = 153},
  black   = {gui = '#1A1B26', cterm = 234},
  green   = {gui = '#9ECE6A', cterm = 149},
  blue    = {gui = '#7AA2F7', cterm = 111},
  cyan    = {gui = '#73DACA', cterm = 80 },
  red     = {gui = '#F7768E', cterm = 210},
  magenta = {gui = '#BB9AF7', cterm = 141},
  yellow  = {gui = '#E0AF68', cterm = 179},

  bright_black  = {gui = '#15161E', cterm = 233},
  bright_white  = {gui = '#DADFE1', cterm = 253},
  bright_blue   = {gui = '#3D59A1', cterm = 62 },
  blue_two      = {gui = '#3B4261', cterm = 239},
  gray_two      = {gui = '#222229', cterm = 235},

  gray       = {gui = '#565F89', cterm = 60},
  light_gray = {gui = '#292E42', cterm = 236},
  dark_gray  = {gui = '#6B7678', cterm = 243},
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
      constant = color.yellow,
      storage  = color.blue,
      special  = color.dark_gray,
      error    = color.red,
      error_bg = nil
    },
    ui = {
      cursorline    = color.light_gray,
      selection     = color.light_gray,
      colorcolumn   = color.bright_black,
      dark_text     = color.dark_gray,
      line_nr       = color.dark_gray,
      line_bg       = color.bright_black,
      folds         = color.dark_gray,
      menu_item     = color.bright_black,
      menu_selected = color.light_gray,
      search        = color.yellow,
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
      yellow  = color.yellow.gui,
      cyan    = color.cyan.gui,
    },
    groups = {
      PmenuThumb = {bg = color.blue_two},
      PmenuSbar  = {bg = color.gray_two},
      Search     = {bg = color.bright_blue},
    }
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


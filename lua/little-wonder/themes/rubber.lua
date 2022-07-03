local color = {
  white   = {gui = '#ABB2BF', cterm = 249},
  black   = {gui = '#21252B', cterm = 234},
  green   = {gui = '#98C379', cterm = 108},
  blue    = {gui = '#61AFEF', cterm = 75 },
  cyan    = {gui = '#56B6C2', cterm = 73 },
  red     = {gui = '#E06C75', cterm = 168},
  magenta = {gui = '#BF79C3', cterm = 139},
  yellow  = {gui = '#D19A66', cterm = 173},

  dark_gray      = {gui = '#737C8C', cterm = 8  },
  wild_red       = {gui = '#DF334A', cterm = 167},
  dark_blue      = {gui = '#3B4049', cterm = 236},
  bright_white   = {gui = '#D4D7D9', cterm = 188},
  bright_black   = {gui = '#5F6672', cterm = 239},
  darkness       = {gui = '#2F3542', cterm = 235},
  black_metal    = {gui = '#2C3036', cterm = 236},
  light_gray     = {gui = '#56595E', cterm = 240}
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
      string   = color.green,
      constant = color.magenta,
      storage  = color.blue,
      special  = color.dark_gray,
      error    = color.wild_red,
      error_bg = nil
    },
    ui = {
      cursorline    = color.dark_blue,
      selection     = color.dark_blue,
      colorcolumn   = color.bright_black,
      dark_text     = color.dark_gray,
      line_nr       = color.dark_gray,
      line_bg       = color.darkness,
      folds         = color.dark_gray,
      menu_item     = color.black_metal,
      menu_selected = color.light_gray,
      search        = color.yellow,
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


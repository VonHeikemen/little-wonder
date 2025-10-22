# Little Wonder

A collection of extensible color schemes with minimal amount of highlighting for Neovim.

Inspired by the same premise of the [alabaster color scheme](https://github.com/tonsky/sublime-scheme-alabaster) for Sublime Text it defines just four classes:

- Strings
- Known constants (numbers, symbols, booleans)
- Comments
- Functions

## Getting Started

Make sure you have [Neovim v0.7.0](https://github.com/neovim/neovim/releases/tag/v0.7.0) or greater.

### Installation

Use your favorite plugin manager. For example.

With `mini.deps`:

```lua
MiniDeps.add('VonHeikemen/little-wonder')
```

With `vim-plug`:

```vim
Plug 'VonHeikemen/little-wonder'
```

## Themes

- `lw-rubber`

![preview rubber theme on a javascript file](https://raw.githubusercontent.com/VonHeikemen/little-wonder/main/assets/screenshot-rubber.png)

- `lw-mariana`

![preview mariana theme on a javascript file](https://raw.githubusercontent.com/VonHeikemen/little-wonder/main/assets/screenshot-mariana.png)

- `lw-owl`

![preview owl theme](https://raw.githubusercontent.com/VonHeikemen/little-wonder/main/assets/screenshot-owl.png)

- `lw-summer`

![preview summer theme on a javascript file](https://raw.githubusercontent.com/VonHeikemen/little-wonder/main/assets/screenshot-summer.png)

## Create your own theme

> Documentation on this subject is a work in progress.

Did you know colorschemes can be lua files? Yes, they can. You can make use of the helper functions on this plugin to create your very own colorscheme.

The first step to create a colorscheme is to create a `colors` folder right next to your `init` file. Next, inside that new folder, create a lua file with the name of your colorscheme.

### By extending an available theme

Each [theme](https://github.com/VonHeikemen/little-wonder/tree/main/lua/themes) has an `.update` function that allows you to override the default values. What are the defaults? Well, they are divided in four categories.

* globals
* syntax
* ui
* terminal

Each "category" is a table that can take a "highlight". And, a "highlight" is a table that contains the properties `gui` and `cterm`. `gui` is a string with an hexadecimal code that represents a color. `cterm` must be a number within the range of 0 and 255, these represent colors (some) terminals support (here is a [cheatsheet](https://www.ditig.com/256-colors-cheat-sheet) with previews of colors for `cterm`).

If you want to get familiar with all the properties in each category I recommend reading the source code of one theme.

Anyway, here is an example that show how can you make a theme based on `lw-rubber`. For this example we'll create a theme called `darkling`. Make a `colors/darkling.lua`.

```lua
local lw = require('little-wonder')
local rubber = require('little-wonder.themes.rubber')

local theme = rubber.update({
  globals = {
    background = lw.NONE  --> use the background of terminal
  },
  syntax = {
    string  = {gui = '#FFEB95', cterm = 222},
    storage = {gui = '#89C4F4', cterm = 75 }
  }
})

lw.apply('darkling', theme)

---
-- Custom rules
---

-- make telescope matches yellow
lw.highlight('TelescopeMatching', {gui = '#FFEB95'})

-- make matching pair the same color as booleans (why not?)
lw.link('MatchParen', 'Boolean')
```

Notice here that I also showed `.highlight` and `.link`, they don't do much. Those two are just tiny wrappers around `vim.api.nvim_set_hl`, you can use that function directly if you want to.

Now in you `init.lua` make sure you can use it only when `little-wonder` is installed.

```lua
local ok, lw = pcall(require, 'little-wonder')

if ok then vim.cmd('colorscheme darkling') end
```

If you use an `init.vim`.

```vim
try
  colorscheme darkling
catch
  " do something else
endtry
```

### Create from scratch

You don't have to base your new colorscheme from an existing one. You can do it "from scratch".

```lua
local lw = require('little-wonder')

local color = {
  white   = {gui = '#DCE0DD', cterm = 249},
  black   = {gui = '#2F343F', cterm = 234},
  green   = {gui = '#87D37C', cterm = 108},
  blue    = {gui = '#89C4F4', cterm = 75 },
  cyan    = {gui = '#50C6D8', cterm = 73 },
  red     = {gui = '#FC8680', cterm = 168},
  magenta = {gui = '#DDA0DD', cterm = 139},
  yellow  = {gui = '#F2CA27', cterm = 173},

  bright_black  = {gui = '#5F6672', cterm = 242},
  bright_white  = {gui = '#DADFE1', cterm = 253},

  dark_gray  = {gui = '#939393', cterm = 246},
  gray       = {gui = '#8893A6', cterm = 103},
  light_gray = {gui = '#404750', cterm = 238},
  wild_red   = {gui = '#DF334A', cterm = 167},
  dark_blue  = {gui = '#242830', cterm = 235},
  darkness   = {gui = '#3B4252', cterm = 238},
}

local theme = {
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
    selection     = color.light_gray,
    colorcolumn   = color.bright_black,
    dark_text     = color.dark_gray,
    line_nr       = color.dark_gray,
    line_bg       = color.darkness,
    folds         = color.dark_gray,
    menu_item     = color.dark_blue,
    menu_selected = color.bright_black,
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
  }
}

lw.apply('darkling', theme)

---
-- Custom rules
-- 

-- do whatever you want...
```

That's it. A "theme" is actually just a lua table.

## Support

If you find this project useful and want to support my efforts, you can donate in [ko-fi.com/vonheikemen](https://ko-fi.com/vonheikemen).

[![buy me a coffee](https://res.cloudinary.com/vonheikemen/image/upload/v1726766343/gzu1l1mx3ou7jmp0tkvt.webp)](https://ko-fi.com/vonheikemen)


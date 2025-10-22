local M = {}
local H = {}

local FG   = {}
local BG   = {}
local none = {gui = 'NONE', cterm = 'NONE'}
local ts_legacy = vim.fn.has('nvim-0.9') == 0

M.no_color = 'LittleWonderNone'
M.normal = 'LittleWonderNormal'

local hs = function(group, colors, style)
  local opts = {
    fg = colors.fg.gui,
    bg = colors.bg.gui,
    ctermfg = colors.fg.cterm,
    ctermbg = colors.bg.cterm,
  }

  for _, item in ipairs(style) do
    opts[item] = true
  end

  vim.api.nvim_set_hl(0, group, opts)
end

local hi = function(group, colors)
  vim.api.nvim_set_hl(0, group, {
    fg = colors.fg.gui,
    bg = colors.bg.gui,
    ctermfg = colors.fg.cterm,
    ctermbg = colors.bg.cterm,
  })
end

local link = function(group, link)
  vim.api.nvim_set_hl(0, group, {link = link})
end

local clear = function(group)
  vim.api.nvim_set_hl(0, group, {})
end

function H.set_normal(theme)
  FG.gui = theme.foreground.gui or 'NONE'
  BG.gui = theme.background.gui or 'NONE'
  FG.cterm = theme.foreground.cterm or 'NONE'
  BG.cterm = theme.background.cterm or 'NONE'

  hi('Normal', {fg = FG, bg = BG})
  hi(M.normal, {fg = FG, bg = none})
  hi(M.no_color, {fg = none,   bg = none})
end

function H.base_syntax(theme)
  local ebg = theme.error_bg or none

  hi('Comment',     {fg = theme.comment,  bg = none})
  hi('String',      {fg = theme.string,   bg = none})
  hi('Character',   {fg = theme.constant, bg = none})
  hi('Number',      {fg = theme.constant, bg = none})
  hi('Boolean',     {fg = theme.constant, bg = none})
  hi('Float',       {fg = theme.constant, bg = none})
  hi('Function',    {fg = theme.storage,  bg = none})
  hi('Special',     {fg = theme.special,  bg = none})
  hi('SpecialChar', {fg = theme.special,  bg = none})
  hi('SpecialKey',  {fg = theme.special,  bg = none})
  hi('Error',       {fg = theme.error,    bg = ebg })

  clear('Constant')
  clear('Statement')
  clear('Conditional')
  clear('Exception')
  clear('Identifier')
  clear('Type')
  clear('Repeat')
  clear('Label')
  clear('Operator')
  clear('Keyword')
  clear('Delimiter')
  clear('Tag')
  clear('SpecialComment')
  clear('Debug')
  clear('PreProc')
  clear('Include')
  clear('Define')
  clear('Macro')
  clear('PreCondit')
  clear('StorageClass')
  clear('Structure')
  clear('Typedef')
  clear('Title')
  clear('Todo')
end

function H.ui(theme)
  local underline = {'underline'}
  local syntax = theme.syntax
  local ui = theme.ui

  hi('Cursor',       {fg = BG,           bg = FG              })
  hi('CursorLine',   {fg = none,         bg = ui.cursorline   })
  hi('CursorLineNr', {fg = none,         bg = BG              })
  hi('ColorColumn',  {fg = none,         bg = ui.colorcolumn  })
  hi('LineNr',       {fg = ui.line_nr,   bg = none            })
  hi('NonText',      {fg = ui.line_nr,   bg = BG              })
  hi('EndOfBuffer',  {fg = ui.dark_text, bg = BG              })
  hi('VertSplit',    {fg = ui.line_bg,   bg = BG              })
  hi('Folded',       {fg = ui.folds,     bg = BG              })
  hi('FoldColumn',   {fg = ui.folds,     bg = BG              })
  hi('SignColumn',   {fg = none,         bg = BG              })
  hi('PMenu',        {fg = none,         bg = ui.menu_item    })
  hi('PMenuSel',     {fg = none,         bg = ui.menu_selected})
  hi('TabLine',      {fg = none,         bg = ui.line_bg      })
  hi('TabLineFill',  {fg = none,         bg = ui.line_bg      })
  hi('TabLineSel',   {fg = none,         bg = BG              })
  hi('StatusLine',   {fg = none,         bg = ui.line_bg      })
  hi('StatusLineNC', {fg = ui.dark_text, bg = ui.line_bg      })
  hi('WildMenu',     {fg = BG,           bg = ui.search       })
  hi('Visual',       {fg = none,         bg = ui.selection    })
  hi('Search',       {fg = BG,           bg = ui.search       })
  hi('IncSearch',    {fg = BG,           bg = ui.search       })

  hs('MatchParen', {fg = ui.matchparen, bg = none}, underline)

  hi('ErrorMsg',   {fg = ui.error,   bg = none})
  hi('WarningMsg', {fg = ui.warning, bg = none})

  hi('DiagnosticError', {fg = ui.error,   bg = none})
  hi('DiagnosticWarn',  {fg = ui.warning, bg = none})
  hi('DiagnosticInfo',  {fg = ui.info,    bg = none})
  hi('DiagnosticHint',  {fg = FG,         bg = none})

  hs('DiagnosticUnderlineError', {fg = ui.error,   bg = none}, underline)
  hs('DiagnosticUnderlineWarn',  {fg = ui.warning, bg = none}, underline)
  hs('DiagnosticUnderlineInfo',  {fg = ui.info,    bg = none}, underline)
  hs('DiagnosticUnderlineHint',  {fg = FG,         bg = none}, underline)

  hi('NotifyWARNIcon',    {fg = ui.warning, bg = none})
  hi('NotifyWARNBorder',  {fg = ui.warning, bg = none})
  hi('NotifyWARNTitle',   {fg = ui.warning, bg = none})
  hi('NotifyERRORIcon',   {fg = ui.error,   bg = none})
  hi('NotifyERRORBorder', {fg = ui.error,   bg = none})
  hi('NotifyERRORTitle',  {fg = ui.error,   bg = none})

  hi('MiniStatuslineModeNormal',  {fg = BG, bg = syntax.storage })
  hi('MiniStatuslineModeVisual',  {fg = BG, bg = syntax.constant})
  hi('MiniStatuslineModeInsert',  {fg = BG, bg = syntax.string  })
  hi('MiniStatuslineModeCommand', {fg = BG, bg = syntax.special })
  hi('MiniStatuslineModeOther',   {fg = BG, bg = syntax.comment })
end

function H.apply_links()
  -- UI: Misc
  link('Conceal', 'Visual')

  -- UI: Diff
  link('DiffAdd',    'DiagnosticWarn')
  link('DiffChange', 'DiagnosticInfo')
  link('DiffDelete', 'DiagnosticError')
  link('DiffText',   'Visual')

  -- UI: search
  link('CurSearch', 'IncSearch')

  -- UI: window
  link('FloatBorder', 'Normal')

  -- UI: messages
  link('Question', 'String')

  -- UI: Diagnostic
  link('DiagnosticSignError', 'DiagnosticError')
  link('DiagnosticSignWarn',  'DiagnosticWarn')
  link('DiagnosticSignInfo',  'DiagnosticInfo')
  link('DiagnosticSignHint',  'DiagnosticHint')
  link('DiagnosticFloatingError', 'DiagnosticError')
  link('DiagnosticFloatingWarn',  'DiagnosticWarn')
  link('DiagnosticFloatingInfo',  'DiagnosticInfo')
  link('DiagnosticFloatingHint',  'DiagnosticHint')
  link('DiagnosticVirtualTextError', 'DiagnosticError')
  link('DiagnosticVirtualTextWarn',  'DiagnosticWarn')
  link('DiagnosticVirtualTextInfo',  'DiagnosticInfo')
  link('DiagnosticVirtualTextHint',  'DiagnosticHint')

  -- UI: Netrw
  link('Directory',     'Function')
  link('netrwDir',      'Function')
  link('netrwHelpCmd',  'Special')
  link('netrwMarkFile', 'Search')

  -- Plugin: NERDTree
  link('NERDTreeDir',       'Function')
  link('NERDTreeDirSlash',  'Function')
  link('NERDTreeUp',        'Function')
  link('NERDTreeOpenable',  'Function')
  link('NERDTreeClosable',  'Function')
  link('NERDTreeToggleOn',  'Boolean')
  link('NERDTreeToggleOff', 'Boolean')
  link('NERDTreeHelp',      'Comment')

  -- Plugin: lir.nvim
  link('LirDir', 'Function')

  -- Plugin: snacks.nvim
  clear('SnacksPickerDir')
  link('SnacksPickerListCursorLine', 'CursorLine')

  -- Plugin: mini.snippets
  clear('MiniSnippetsCurrent')
  link('MiniSnippetsCurrentReplace', 'Visual')
  clear('MiniSnippetsFinal')
  clear('MiniSnippetsUnvisited')
  clear('MiniSnippetsVisited')

  -- Language: lua
  -- Syntax: built-in
  clear('luaFunction')

  -- Language: HTML
  -- Syntax: built-in
  link('htmlTag',            'Special')
  link('htmlEndTag',         'Special')
  link('htmlTagName',        'Function')
  link('htmlSpecialTagName', 'Function')
  clear('htmlArg')


  -- Language: CSS
  -- Syntax: built-in
  link('cssTagName',           'Function')
  link('cssColor',             'Number')
  clear('cssVendor')
  clear('cssBraces')
  clear('cssSelectorOp')
  clear('cssSelectorOp2')
  clear('cssIdentifier')
  clear('cssClassName')
  clear('cssClassNameDot')
  clear('cssVendor')
  clear('cssImportant')
  clear('cssAttributeSelector')


  -- Language: PHP
  -- Syntax: built-in
  link('phpNullValue', 'Boolean')
  link('phpSpecialFunction',   'Function')
  clear('phpParent')
  clear('phpClasses')


  -- Language: Javascript
  -- Syntax: built-in
  link('javaScriptNumber',   'Number')
  link('javaScriptNull',     'Number')
  clear('javaScriptBraces')
  clear('javaScriptFunction')


  -- Language: Javascript
  -- Syntax: 'pangloss/vim-javascript'
  link('jsFunctionKey', 'Function')
  link('jsUndefined',   'Number')
  link('jsNull',        'Number')
  clear('jsSuper')
  clear('jsThis')
  clear('jsArguments')


  -- Language: Typescript
  -- Syntax: built-in
  clear('typescriptImport')
  clear('typescriptExport')
  clear('typescriptBraces')
  clear('typescriptDecorator')
  clear('typescriptParens')
  clear('typescriptCastKeyword')


  -- Language: JSX
  -- Syntax: 'maxmellon/vim-jsx-pretty'
  link('jsxTagName',       'Function')
  link('jsxComponentName', 'Function')
  link('jsxPunct',         'Special')
  link('jsxCloseString',   'Special')
  link('jsxEqual',         'Special')
  clear('jsxAttrib')


  -- Language: Twig
  -- Syntax: 'lumiliet/vim-twig'
  link('twigString', 'String')
  clear('twigOperator')


  -- Language: Ruby
  -- Syntax: 'vim-ruby/vim-ruby'
  link('rubyClassName',        'Function')
  link('rubyModuleName',       'Function')
  link('rubySymbol',           'Number')
  link('rubyMagicComment',     'Comment')
  link('rubyHeredocDelimiter', 'Special')


  -- Language: V
  -- Syntax: 'ollykel/v-vim'
  link('vFunctionCall', 'Function')
  link('vBuiltins', 'Function')
  clear('vStringVar')
  clear('vType')


  -- Language: Nelua
  -- Syntax: 'stefanos82/nelua.vim'
  link('neluaFunc', 'Function')
  clear('neluaFunction')


  -- Python
  link('pythonDecorator',     'Special')
  clear('pythonDecoratorName')
  clear('pythonBuiltin')

  -- Treesitter
  if ts_legacy then
    link('TSConstBuiltin', 'Number')
    link('TSFuncBuiltin',  'Function')
    clear('TSConstructor')
    clear('TSVariableBuiltin')
    clear('luaTSPunctBracket')
    clear('TSKeywordFunction')
  else
    link('@function.call', 'Function')
    link('@function.builtin', 'Function')
    link('@constant.builtin', 'Number')
    link('@type.css', 'Function')
    link('@constructor.php', 'Function')
    link('@tag.delimiter', 'Special')
    link('@tag', 'Function')
    link('@text.uri.html', 'String')

    clear('@variable')
    clear('@punctuation.bracket')
    clear('@constructor')
    clear('@method.vue')
    clear('@tag.attribute')
    clear('@text.literal')
    clear('@text.literal.vimdoc')
    clear('@text.literal.vimdoc')
    clear('@variable.builtin.php')
    clear('@tag.delimiter.twig')
    clear('@punctuation.bracket.twig')
    clear('@string.special.url.html', 'String')
    clear('@markup.link.markdown_inline')
    clear('@markup.link.label.markdown_inline')
    clear('@markup.link.url.markdown_inline')
    clear('@markup.raw.block.markdown')
    clear('@punctuation.special.markdown')
    clear('@markup.raw.block.vimdoc')
  end
end

function H.custom_groups(groups)
  for group, params in pairs(groups) do
    M.highlight(group, params.fg or {}, params.bg or {}, params.style or {})
  end
end

function H.terminal(theme)
  vim.g.terminal_color_foreground = FG.gui
  vim.g.terminal_color_background = BG.gui

  -- black
  vim.g.terminal_color_0  = theme.black
  vim.g.terminal_color_8  = theme.bright_black or theme.black

  -- red
  vim.g.terminal_color_1  = theme.red
  vim.g.terminal_color_9  = theme.bright_red or theme.red

  -- green
  vim.g.terminal_color_2  = theme.green
  vim.g.terminal_color_10 = theme.bright_green or theme.green

  -- yellow
  vim.g.terminal_color_3  = theme.yellow
  vim.g.terminal_color_11 = theme.bright_yellow or theme.yellow

  -- blue
  vim.g.terminal_color_4  = theme.blue
  vim.g.terminal_color_12 = theme.bright_blue or theme.blue

  -- magenta
  vim.g.terminal_color_5  = theme.magenta
  vim.g.terminal_color_13 = theme.bright_magenta or theme.magenta

  -- cyan
  vim.g.terminal_color_6  = theme.cyan
  vim.g.terminal_color_14 = theme.bright_cyan or theme.cyan

  -- white
  vim.g.terminal_color_7  = theme.white
  vim.g.terminal_color_15 = theme.bright_white or theme.white
end

function H.init(name, args)
  vim.cmd('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end

  vim.o.background = args.type
  vim.g.colors_name = name
end

function M.apply(name, theme)
  H.init(name, theme.globals)
  H.set_normal(theme.globals)
  H.ui(theme)
  H.base_syntax(theme.syntax)
  H.apply_links()
  H.terminal(theme.terminal)
  if theme.groups then
    H.custom_groups(theme.groups)
  end
end

function M.highlight(group, fg, bg, style)
  local opts = {}

  if fg.gui then
    opts.fg = fg.gui
  end

  if fg.cterm then
    opts.ctermfg = fg.cterm
  end

  if type(style) == 'table' then
    for _, item in ipairs(style) do
      opts[item] = true
    end
  end

  if bg == nil then
    opts.bg = 'NONE'
    opts.ctermbg = 'NONE'
  elseif type(bg) == 'table' then
    opts.bg = bg.gui
    opts.ctermbg = bg.cterm
  end

  vim.api.nvim_set_hl(0, group, opts)
end

function M.set_hl(group, style)
  vim.api.nvim_set_hl(0, group, style)
end

M.link = link
M.NONE = none

return M


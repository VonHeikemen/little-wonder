local M = {}

local none = {gui = 'NONE',    cterm = 'NONE'}
local FG   = {gui = '#DCE0DD', cterm = 253   }
local BG = none
local lw_normal = 'LittleWonderNormal'
local lw_none = 'LittleWonderNone'

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

M.set_background = function(val)
  BG = val
end

M.set_foreground = function(val)
  FG = val
end

M.base_syntax = function(theme)
  local ebg = theme.error_bg or none

  hi(lw_none,   {fg = none, bg = none})
  hi(lw_normal, {fg = FG,   bg = none})

  hi('Normal',      {fg = FG,             bg = BG  })
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

  hi('Constant',       {fg = none, bg = none})
  hi('Statement',      {fg = none, bg = none})
  hi('Conditional',    {fg = none, bg = none})
  hi('Exception',      {fg = none, bg = none})
  hi('Identifier',     {fg = none, bg = none})
  hi('Type',           {fg = none, bg = none})
  hi('Repeat',         {fg = none, bg = none})
  hi('Label',          {fg = none, bg = none})
  hi('Operator',       {fg = none, bg = none})
  hi('Keyword',        {fg = none, bg = none})
  hi('Delimiter',      {fg = none, bg = none})
  hi('Tag',            {fg = none, bg = none})
  hi('SpecialComment', {fg = none, bg = none})
  hi('Debug',          {fg = none, bg = none})
  hi('PreProc',        {fg = none, bg = none})
  hi('Include',        {fg = none, bg = none})
  hi('Define',         {fg = none, bg = none})
  hi('Macro',          {fg = none, bg = none})
  hi('PreCondit',      {fg = none, bg = none})
  hi('StorageClass',   {fg = none, bg = none})
  hi('Structure',      {fg = none, bg = none})
  hi('Typedef',        {fg = none, bg = none})
  hi('Title',          {fg = none, bg = none})
  hi('Todo',           {fg = none, bg = none})
end

M.ui = function(theme)
  local underline = {'underline'}

  hi('Cursor',       {fg = BG,              bg = FG                 })
  hi('CursorLine',   {fg = none,            bg = theme.cursorline   })
  hi('CursorLineNr', {fg = none,            bg = BG                 })
  hi('ColorColumn',  {fg = none,            bg = theme.colorcolumn  })
  hi('LineNr',       {fg = theme.line_nr,   bg = none               })
  hi('NonText',      {fg = theme.line_nr,   bg = BG                 })
  hi('EndOfBuffer',  {fg = theme.dark_text, bg = BG                 })
  hi('VertSplit',    {fg = theme.line_bg,   bg = BG                 })
  hi('Folded',       {fg = theme.folds,     bg = BG                 })
  hi('FoldColumn',   {fg = theme.folds,     bg = BG                 })
  hi('SignColumn',   {fg = none,            bg = BG                 })
  hi('PMenu',        {fg = none,            bg = theme.menu_item    })
  hi('PMenuSel',     {fg = none,            bg = theme.menu_selected})
  hi('TabLine',      {fg = none,            bg = theme.line_bg      })
  hi('TabLineFill',  {fg = none,            bg = theme.line_bg      })
  hi('TabLineSel',   {fg = none,            bg = BG                 })
  hi('StatusLine',   {fg = none,            bg = theme.line_bg      })
  hi('StatusLineNC', {fg = theme.dark_text, bg = theme.line_bg      })
  hi('WildMenu',     {fg = BG,              bg = theme.search       })
  hi('Visual',       {fg = none,            bg = theme.selection    })
  hi('Search',       {fg = BG,              bg = theme.search       })
  hi('IncSearch',    {fg = BG,              bg = theme.search       })

  hs('MatchParen', {fg = theme.matchparen, bg = none}, underline)

  hi('ErrorMsg',   {fg = theme.error,   bg = none})
  hi('WarningMsg', {fg = theme.warning, bg = none})

  hi('DiagnosticError', {fg = theme.error,   bg = none})
  hi('DiagnosticWarn',  {fg = theme.warning, bg = none})
  hi('DiagnosticInfo',  {fg = theme.info,    bg = none})
  hi('DiagnosticHint',  {fg = FG,            bg = none})

  hs('DiagnosticUnderlineError', {fg = theme.error,   bg = none}, underline)
  hs('DiagnosticUnderlineWarn',  {fg = theme.warning, bg = none}, underline)
  hs('DiagnosticUnderlineInfo',  {fg = theme.info,    bg = none}, underline)
  hs('DiagnosticUnderlineHint',  {fg = FG,            bg = none}, underline)


  hi('NotifyWARNIcon',    {fg = theme.warning, bg = none})
  hi('NotifyWARNBorder',  {fg = theme.warning, bg = none})
  hi('NotifyWARNTitle',   {fg = theme.warning, bg = none})
  hi('NotifyERRORIcon',   {fg = theme.error,   bg = none})
  hi('NotifyERRORBorder', {fg = theme.error,   bg = none})
  hi('NotifyERRORTitle',  {fg = theme.error,   bg = none})
end

M.apply_links = function()
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

  -- Language: lua
  -- Syntax: built-in
  link('luaFunction', lw_none)

  -- Language: HTML
  -- Syntax: built-in
  link('htmlTag',            'Special')
  link('htmlEndTag',         'Special')
  link('htmlTagName',        'Function')
  link('htmlSpecialTagName', 'Function')
  link('htmlArg',            lw_none)


  -- Language: CSS
  -- Syntax: built-in
  link('cssTagName',           'Function')
  link('cssColor',             'Number')
  link('cssVendor',            lw_none)
  link('cssBraces',            lw_none)
  link('cssSelectorOp',        lw_none)
  link('cssSelectorOp2',       lw_none)
  link('cssIdentifier',        lw_none)
  link('cssClassName',         lw_none)
  link('cssClassNameDot',      lw_none)
  link('cssVendor',            lw_none)
  link('cssImportant',         lw_none)
  link('cssAttributeSelector', lw_none)


  -- Language: PHP
  -- Syntax: built-in
  link('phpNullValue', 'Boolean')
  link('phpParent',    lw_none)
  link('phpClasses',   lw_none)


  -- Language: Javascript
  -- Syntax: built-in
  link('javaScriptNumber',   'Number')
  link('javaScriptNull',     'Number')
  link('javaScriptBraces',   lw_none)
  link('javaScriptFunction', lw_none)


  -- Language: Javascript
  -- Syntax: 'pangloss/vim-javascript'
  link('jsFunctionKey', 'Function')
  link('jsUndefined',   'Number')
  link('jsNull',        'Number')
  link('jsSuper',       lw_none)
  link('jsThis',        lw_none)
  link('jsArguments',   lw_none)


  -- Language: Typescript
  -- Syntax: built-in
  link('typescriptImport', lw_none)
  link('typescriptExport', lw_none)
  link('typescriptBraces', lw_none)
  link('typescriptDecorator', lw_none)
  link('typescriptParens', lw_none)
  link('typescriptCastKeyword', lw_none)


  -- Language: JSX
  -- Syntax: 'maxmellon/vim-jsx-pretty'
  link('jsxTagName',       'Function')
  link('jsxComponentName', 'Function')
  link('jsxPunct',         'Special')
  link('jsxCloseString',   'Special')
  link('jsxEqual',         'Special')
  link('jsxAttrib',        lw_none)


  -- Language: Twig
  -- Syntax: 'lumiliet/vim-twig'
  link('twigString', 'String')


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
  link('vStringVar', lw_none)
  link('vType', lw_none)

  -- Python
  link('pythonDecorator',     'Special')
  link('pythonDecoratorName', lw_none)
  link('pythonBuiltin',       lw_none)

  -- Treesitter (old highlight groups)
  link('TSConstructor',     lw_none)
  link('TSVariableBuiltin', lw_none)
  link('TSConstBuiltin',    'Number')
  link('TSFuncBuiltin',     'Function')
  link('luaTSPunctBracket', lw_none)
  link('TSKeywordFunction', lw_none)

  -- Treesitter
  link('@function.call', 'Function')
  link('@function.builtin', 'Function')
  link('@punctuation.bracket', lw_none)
  link('@constant.builtin', 'Number')
  link('@constructor', lw_none)
  link('@type.css', 'Function')
  link('@constructor.php', 'Function')
  link('@method.vue', lw_none)
  link('@tag.delimiter', 'Special')
  link('@tag.attribute', lw_none)
  link('@tag', 'Function')
end

M.custom_groups = function(groups)
  for group, style in pairs(groups) do
    M.highlight(group, style.fg or {}, style.bg or {})
  end
end

M.terminal = function(theme)
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

M.init = function(name, args)
  vim.cmd('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end

  vim.opt.background = args.type
  vim.g.colors_name = name
end

M.apply = function(name, theme)
  M.init(name, theme.globals)
  M.set_foreground(theme.globals.foreground)
  M.set_background(theme.globals.background)
  M.ui(theme.ui)
  M.base_syntax(theme.syntax)
  M.apply_links()
  M.terminal(theme.terminal)
  if theme.groups then
    M.custom_groups(theme.groups)
  end
end

M.highlight = function(group, style, bg)
  local opts = {}

  if style.gui then
    opts.fg = style.gui
  end

  if style.cterm then
    opts.ctermfg = style.cterm
  end

  if type(style.style) == 'table' and style.style then
    for _, item in ipairs(style.style) do
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

M.merge = function(defaults, override)
  return vim.tbl_deep_extend(
    'force',
    defaults,
    override or {}
  )
end

M.gui = function(str)
  return {gui = str, cterm = 'NONE'}
end

M.set_hl = function(group, style)
  vim.api.nvim_set_hl(0, group, style)
end

M.link = link
M.NONE = none

return M


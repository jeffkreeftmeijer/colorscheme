highlight SpecialKey     guifg=#7CAFC2
highlight TermCursor     gui=reverse
highlight NonText        guifg=#B8B8B8
highlight Directory      guifg=#7CAFC2
highlight ErrorMsg       guifg=#F8F8F8 guibg=#AB4642
highlight IncSearch      gui=reverse
highlight Search         guifg=NONE guibg=#383838
highlight MoreMsg        guifg=#A1B56C
highlight ModeMsg        gui=bold
highlight CursorLineNr   guifg=#F7CA88
highlight Question       guifg=#A1B56C
highlight StatusLine     gui=bold,reverse
highlight StatusLineNC   gui=reverse
highlight VertSplit      gui=reverse
highlight Title          guifg=#BA8BAF
highlight WarningMsg     guifg=#AB4642
highlight WildMenu       guifg=#181818 guibg=#383838
highlight SignColumn     guifg=#7CAFC2 guibg=#D8D8D8
highlight Conceal        guifg=#D8D8D8 guibg=#D8D8D8
highlight SpellBad       guibg=#A1B56C
highlight SpellCap       guibg=#86C1B9
highlight SpellRare      guibg=#BA8BAF
highlight SpellLocal     guibg=#A16946
highlight PmenuSbar      guibg=#585858
highlight PmenuThumb     guibg=#181818
highlight TabLine        gui=underline guifg=#181818 guibg=#D8D8D8
highlight TabLineSel     gui=bold
highlight TabLineFill    gui=reverse
highlight CursorColumn   guibg=#D8D8D8
highlight CursorLine     gui=underline
highlight MatchParen     guibg=#A16946
highlight Constant       guifg=#AB4642
highlight Special        guifg=#BA8BAF
highlight Identifier     gui=NONE guifg=#86C1B9
highlight Statement      guifg=#F7CA88
highlight PreProc        guifg=#BA8BAF
highlight Type           guifg=#A1B56C
highlight Underlined     gui=underline guifg=#BA8BAF
highlight Ignore         guifg=#F8F8F8
highlight Error          guifg=#F8F8F8 guibg=#DC9656
highlight Todo           guifg=#181818 guibg=#383838
highlight DiffAdd        guifg=#181818 guibg=#A1B56C
highlight DiffChange     guifg=#181818 guibg=#F7CA88
highlight DiffDelete     guifg=#181818 guibg=#AB4642
highlight DiffText       guifg=#181818 guibg=#383838 gui=bold
highlight Visual         guifg=NONE guibg=NONE gui=inverse
if &background == "light"
  highlight LineNr      guifg=#D8D8D8
  highlight Comment     guifg=#D8D8D8
  highlight ColorColumn guifg=#585858 guibg=#D8D8D8
  highlight Folded      guifg=#585858 guibg=#D8D8D8
  highlight FoldColumn  guifg=#585858 guibg=#D8D8D8
  highlight Pmenu       guifg=#181818 guibg=#D8D8D8
  highlight PmenuSel    guifg=#D8D8D8 guibg=#D8D8D8
else
  highlight LineNr      guifg=#585858
  highlight Comment     guifg=#585858
  highlight ColorColumn guifg=#D8D8D8 guibg=#585858
  highlight Folded      guifg=#D8D8D8 guibg=#585858
  highlight FoldColumn  guifg=#D8D8D8 guibg=#585858
  highlight Pmenu       guifg=#F8F8F8 guibg=#585858
  highlight PmenuSel    guifg=#585858 guibg=#F8F8F8
endif
highlight Normal     guifg=#D8D8D8 guibg=#181818

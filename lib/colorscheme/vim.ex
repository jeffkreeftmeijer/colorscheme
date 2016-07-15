defmodule Colorscheme.Vim do
  def to_configuration(colors) do
    EEx.eval_string("""
    highlight SpecialKey     guifg=#<%= colors[:blue] |> Color.to_hexadecimal %>
    highlight TermCursor     gui=reverse
    highlight NonText        guifg=#<%= colors[:bright_blue] |> Color.to_hexadecimal %>
    highlight Directory      guifg=#<%= colors[:blue] |> Color.to_hexadecimal %>
    highlight ErrorMsg       guifg=#<%= colors[:bright_white] |> Color.to_hexadecimal %> guibg=#<%= colors[:red] |> Color.to_hexadecimal %>
    highlight IncSearch      gui=reverse
    highlight Search         guifg=NONE guibg=#<%= colors[:bright_yellow] |> Color.to_hexadecimal %>
    highlight MoreMsg        guifg=#<%= colors[:green] |> Color.to_hexadecimal %>
    highlight ModeMsg        gui=bold
    highlight CursorLineNr   guifg=#<%= colors[:yellow] |> Color.to_hexadecimal %>
    highlight Question       guifg=#<%= colors[:green] |> Color.to_hexadecimal %>
    highlight StatusLine     gui=bold,reverse
    highlight StatusLineNC   gui=reverse
    highlight VertSplit      gui=reverse
    highlight Title          guifg=#<%= colors[:magenta] |> Color.to_hexadecimal %>
    highlight WarningMsg     guifg=#<%= colors[:red] |> Color.to_hexadecimal %>
    highlight WildMenu       guifg=#<%= colors[:black] |> Color.to_hexadecimal %> guibg=#<%= colors[:bright_yellow] |> Color.to_hexadecimal %>
    highlight SignColumn     guifg=#<%= colors[:blue] |> Color.to_hexadecimal %> guibg=#<%= colors[:white] |> Color.to_hexadecimal %>
    highlight Conceal        guifg=#<%= colors[:white] |> Color.to_hexadecimal %> guibg=#<%= colors[:white] |> Color.to_hexadecimal %>
    highlight SpellBad       guibg=#<%= colors[:green] |> Color.to_hexadecimal %>
    highlight SpellCap       guibg=#<%= colors[:cyan] |> Color.to_hexadecimal %>
    highlight SpellRare      guibg=#<%= colors[:magenta] |> Color.to_hexadecimal %>
    highlight SpellLocal     guibg=#<%= colors[:bright_cyan] |> Color.to_hexadecimal %>
    highlight PmenuSbar      guibg=#<%= colors[:bright_black] |> Color.to_hexadecimal %>
    highlight PmenuThumb     guibg=#<%= colors[:black] |> Color.to_hexadecimal %>
    highlight TabLine        gui=underline guifg=#<%= colors[:black] |> Color.to_hexadecimal %> guibg=#<%= colors[:white] |> Color.to_hexadecimal %>
    highlight TabLineSel     gui=bold
    highlight TabLineFill    gui=reverse
    highlight CursorColumn   guibg=#<%= colors[:white] |> Color.to_hexadecimal %>
    highlight CursorLine     gui=underline
    highlight MatchParen     guibg=#<%= colors[:bright_cyan] |> Color.to_hexadecimal %>
    highlight Constant       guifg=#<%= colors[:red] |> Color.to_hexadecimal %>
    highlight Special        guifg=#<%= colors[:magenta] |> Color.to_hexadecimal %>
    highlight Identifier     gui=NONE guifg=#<%= colors[:cyan] |> Color.to_hexadecimal %>
    highlight Statement      guifg=#<%= colors[:yellow] |> Color.to_hexadecimal %>
    highlight PreProc        guifg=#<%= colors[:magenta] |> Color.to_hexadecimal %>
    highlight Type           guifg=#<%= colors[:green] |> Color.to_hexadecimal %>
    highlight Underlined     gui=underline guifg=#<%= colors[:magenta] |> Color.to_hexadecimal %>
    highlight Ignore         guifg=#<%= colors[:bright_white] |> Color.to_hexadecimal %>
    highlight Error          guifg=#<%= colors[:bright_white] |> Color.to_hexadecimal %> guibg=#<%= colors[:bright_red] |> Color.to_hexadecimal %>
    highlight Todo           guifg=#<%= colors[:black] |> Color.to_hexadecimal %> guibg=#<%= colors[:bright_yellow] |> Color.to_hexadecimal %>
    highlight DiffAdd        guifg=#<%= colors[:black] |> Color.to_hexadecimal %> guibg=#<%= colors[:green] |> Color.to_hexadecimal %>
    highlight DiffChange     guifg=#<%= colors[:black] |> Color.to_hexadecimal %> guibg=#<%= colors[:yellow] |> Color.to_hexadecimal %>
    highlight DiffDelete     guifg=#<%= colors[:black] |> Color.to_hexadecimal %> guibg=#<%= colors[:red] |> Color.to_hexadecimal %>
    highlight DiffText       guifg=#<%= colors[:black] |> Color.to_hexadecimal %> guibg=#<%= colors[:bright_yellow] |> Color.to_hexadecimal %> gui=bold
    highlight Visual         guifg=NONE guibg=NONE gui=inverse
    if &background == "light"
      highlight LineNr      guifg=#<%= colors[:white] |> Color.to_hexadecimal %>
      highlight Comment     guifg=#<%= colors[:white] |> Color.to_hexadecimal %>
      highlight ColorColumn guifg=#<%= colors[:bright_black] |> Color.to_hexadecimal %> guibg=#<%= colors[:white] |> Color.to_hexadecimal %>
      highlight Folded      guifg=#<%= colors[:bright_black] |> Color.to_hexadecimal %> guibg=#<%= colors[:white] |> Color.to_hexadecimal %>
      highlight FoldColumn  guifg=#<%= colors[:bright_black] |> Color.to_hexadecimal %> guibg=#<%= colors[:white] |> Color.to_hexadecimal %>
      highlight Pmenu       guifg=#<%= colors[:black] |> Color.to_hexadecimal %> guibg=#<%= colors[:white] |> Color.to_hexadecimal %>
      highlight PmenuSel    guifg=#<%= colors[:white] |> Color.to_hexadecimal %> guibg=#<%= colors[:white] |> Color.to_hexadecimal %>
    else
      highlight LineNr      guifg=#<%= colors[:bright_black] |> Color.to_hexadecimal %>
      highlight Comment     guifg=#<%= colors[:bright_black] |> Color.to_hexadecimal %>
      highlight ColorColumn guifg=#<%= colors[:white] |> Color.to_hexadecimal %> guibg=#<%= colors[:bright_black] |> Color.to_hexadecimal %>
      highlight Folded      guifg=#<%= colors[:white] |> Color.to_hexadecimal %> guibg=#<%= colors[:bright_black] |> Color.to_hexadecimal %>
      highlight FoldColumn  guifg=#<%= colors[:white] |> Color.to_hexadecimal %> guibg=#<%= colors[:bright_black] |> Color.to_hexadecimal %>
      highlight Pmenu       guifg=#<%= colors[:bright_white] |> Color.to_hexadecimal %> guibg=#<%= colors[:bright_black] |> Color.to_hexadecimal %>
      highlight PmenuSel    guifg=#<%= colors[:bright_black] |> Color.to_hexadecimal %> guibg=#<%= colors[:bright_white] |> Color.to_hexadecimal %>
    endif
    """, colors: colors)
	end
end

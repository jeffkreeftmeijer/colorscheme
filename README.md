# Colorscheme

A library to generate Terminal.app and iTerm2 color schemes. Used for [wwdc16.terminal].

[wwdc16.terminal]: https://github.com/jeffkreeftmeijer/wwdc16.terminal

## Installation

```elixir
# mix.exs
def deps do
  [{:color, git: "git://github.com/jeffkreeftmeijer/color.git"}]
  [{:colorscheme, git: "git://github.com/jeffkreeftmeijer/colorscheme.git"}]
end
```

## Usage

To create a [mix] task that takes a list of colors and saves it as a Terminal.app color scheme:

[mix]:http://elixir-lang.org/docs/stable/mix/Mix.html

``` elixir
# lib/generate.ex
defmodule Mix.Tasks.Generate do
  def run(_) do
    plist = [
      black:   "292C36",
      red:     "D2242E",
      green:   "84BD5C",
      yellow:  "C9794B",
      blue:    "716EB1",
      magenta: "A52281",
      cyan:    "379D92",
      white:   "A4A9BA",

      bright_black:   "3F4453",
      bright_red:     "F10513",
      bright_green:   "7FDA3F",
      bright_yellow:  "E6712E",
      bright_blue:    "5852CD",
      bright_magenta: "BE098C",
      bright_cyan:    "1DB8A7",
      bright_white:   "FFFFFF",

      background: "FFFFFF",
      bold_text: "292C36",
      text: "292C36"
    ]
    |> Enum.map(fn({key, color}) -> {key, color |> Color.from_hexadecimal} end)
    |> Colorscheme.Terminal.to_configuration
    File.write("wwdc16-dark.terminal", plist)
  end
end
```

```
$ mix deps.get
* Getting colorscheme (git://github.com/jeffkreeftmeijer/colorscheme.git)
Cloning into '/Users/jeff/opensource/wwdc16.terminal/deps/colorscheme'...
remote: Counting objects: 98, done.
remote: Compressing objects: 100% (37/37), done.
remote: Total 98 (delta 43), reused 97 (delta 42), pack-reused 0
Receiving objects: 100% (98/98), 17.53 KiB | 0 bytes/s, done.
Resolving deltas: 100% (43/43), done.
Checking connectivity... done.
$ mix generate
==> colorscheme
Compiling 1 file (.ex)
Generated colorscheme app
==> wwdc16
Compiling 1 file (.ex)
Generated wwdc16 app
$ head wwdc16-dark.terminal
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
        <key>ANSIBlackColor</key>
        <data>
        YnBsaXN0MDDUAQIDBAUGFRZYJHZlcnNpb25YJG9iamVjdHNZJGFyY2hpdmVy
        VCR0b3ASAAGGoKMHCA9VJG51bGzTCQoLDA0OVU5TUkdCXE5TQ29sb3JTcGFj
        ZVYkY2xhc3NPECcwLjE2MDc4NDMxMzcgMC4xNzI1NDkwMTk2IDAuMjExNzY0
        NzA1OQAQAYAC0hAREhNaJGNsYXNzbmFtZVgkY2xhc3Nlc1dOU0NvbG9yohIU
```

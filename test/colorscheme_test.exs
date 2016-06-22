defmodule Colorscheme.TerminalTest do
  use ExUnit.Case
  doctest Colorscheme.Terminal

  test "creates a color scheme for Terminal.app" do
    assert Colorscheme.Terminal.to_plist(
      black: "222222",
      red: "FF0000",
      green: "00FF00",
      yellow: "FFFF00",
      blue: "0000FF",
      magenta: "FF00FF",
      cyan: "00FFFF",
      white: "AAAAAA",

      bright_black: "888888",
      bright_red: "FF8888",
      bright_green: "00FF88",
      bright_yellow: "FFFF88",
      bright_blue: "8888FF",
      bright_magenta: "FF88FF",
      bright_cyan: "88FFFF",
      bright_white: "DDDDDD",

      background: "000000",
      bold: "FFFFFF",
      text: "FFFFFF"
    ) == File.read!("test/example.terminal")
  end
end

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

  test "converts a color to a binary plist" do
    assert Colorscheme.Terminal.color_to_binary_plist("222222") == """
    YnBsaXN0MDDUAQIDBAUGFRZYJHZlcnNpb25YJG9iamVjdHNZJGFyY2hpdmVyVCR0b3AS
    AAGGoKMHCA9VJG51bGzTCQoLDA0OVU5TUkdCXE5TQ29sb3JTcGFjZVYkY2xhc3NPECcw
    LjEzMzMzMzMzMzMgMC4xMzMzMzMzMzMzIDAuMTMzMzMzMzMzMwAQAYAC0hAREhNaJGNs
    YXNzbmFtZVgkY2xhc3Nlc1dOU0NvbG9yohIUWE5TT2JqZWN0XxAPTlNLZXllZEFyY2hp
    dmVy0RcYVHJvb3SAAQgRGiMtMjc7QUhOW2KMjpCVoKmxtL3P0tcAAAAAAAABAQAAAAAA
    AAAZAAAAAAAAAAAAAAAAAAAA2Q==
    """
  end
end

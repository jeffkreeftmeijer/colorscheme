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
    assert Colorscheme.Terminal.color_to_binary_plist([1,0,1]) == "bplist00\xD4\x01\x02\x03\x04\x05\x06\x15\x16X$versionX$objectsY$archiverT$top\x12\x00\x01\x86\xA0\xA3\a\b\x0FU$null\xD3\t\n\v\f\r\x0EUNSRGB\\NSColorSpaceV$classO\x10'1 0 1\x00\x10\x01\x80\x02\xD2\x10\x11\x12\x13Z$classnameX$classesWNSColor\xA2\x12\x14XNSObject_\x10\x0FNSKeyedArchiver\xD1\x17\x18Troot\x80\x01\b\x11\x1A#-27;AHN[b\x8C\x8E\x90\x95\xA0\xA9\xB1\xB4\xBD\xCF\xD2\xD7\x00\x00\x00\x00\x00\x00\x01\x01\x00\x00\x00\x00\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xD9"
  end

  test "converts a color to a bas64 encoded string" do
    assert Colorscheme.Terminal.color_to_base64_encoded_string("222222") == """
    YnBsaXN0MDDUAQIDBAUGFRZYJHZlcnNpb25YJG9iamVjdHNZJGFyY2hpdmVyVCR0b3AS
    AAGGoKMHCA9VJG51bGzTCQoLDA0OVU5TUkdCXE5TQ29sb3JTcGFjZVYkY2xhc3NPECcw
    LjEzMzMzMzMzMzMgMC4xMzMzMzMzMzMzIDAuMTMzMzMzMzMzMwAQAYAC0hAREhNaJGNs
    YXNzbmFtZVgkY2xhc3Nlc1dOU0NvbG9yohIUWE5TT2JqZWN0XxAPTlNLZXllZEFyY2hp
    dmVy0RcYVHJvb3SAAQgRGiMtMjc7QUhOW2KMjpCVoKmxtL3P0tcAAAAAAAABAQAAAAAA
    AAAZAAAAAAAAAAAAAAAAAAAA2Q==
    """
  end
end

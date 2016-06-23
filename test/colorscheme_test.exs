defmodule Colorscheme.TerminalTest do
  use ExUnit.Case
  doctest Colorscheme.Terminal

  test "creates a color scheme for Terminal.app" do
    assert Colorscheme.Terminal.to_plist(
      black: "222223",
      red: "FF0001",
      green: "00FF01",
      yellow: "FFFF01",
      blue: "0000FE",
      magenta: "FF00FE",
      cyan: "00FFFE",
      white: "AAAAAB",

      bright_black: "888889",
      bright_red: "FF8889",
      bright_green: "00FF89",
      bright_yellow: "FFFF89",
      bright_blue: "8888FE",
      bright_magenta: "FF88FE",
      bright_cyan: "88FFFE",
      bright_white: "DDDDDE",

      background: "000001",
      bold: "FFFFFE",
      text: "FFFFFE"
    ) == File.read!("test/example.terminal")
  end

  test "converts a color to a binary plist" do
    assert Colorscheme.Terminal.color_to_binary_plist([1.0,0.0,1.0]) == "bplist00\xD4\x01\x02\x03\x04\x05\x06\x15\x16X$versionX$objectsY$archiverT$top\x12\x00\x01\x86\xA0\xA3\a\b\x0FU$null\xD3\t\n\v\f\r\x0EUNSRGB\\NSColorSpaceV$classO\x10&1.0 0.0 1.0\x00\x10\x01\x80\x02\xD2\x10\x11\x12\x13Z$classnameX$classesWNSColor\xA2\x12\x14XNSObject_\x10\x0FNSKeyedArchiver\xD1\x17\x18Troot\x80\x01\b\x11\x1A#-27;AHN[b\x8B\x8D\x8F\x94\x9F\xA8\xB0\xB3\xBC\xCE\xD1\xD6\x00\x00\x00\x00\x00\x00\x01\x01\x00\x00\x00\x00\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xD8"
    assert Colorscheme.Terminal.color_to_binary_plist([0.1333333333, 0.1333333333, 0.137254902]) == "bplist00\xD4\x01\x02\x03\x04\x05\x06\x15\x16X$versionX$objectsY$archiverT$top\x12\x00\x01\x86\xA0\xA3\a\b\x0FU$null\xD3\t\n\v\f\r\x0EUNSRGB\\NSColorSpaceV$classO\x10&0.1333333333 0.1333333333 0.137254902\x00\x10\x01\x80\x02\xD2\x10\x11\x12\x13Z$classnameX$classesWNSColor\xA2\x12\x14XNSObject_\x10\x0FNSKeyedArchiver\xD1\x17\x18Troot\x80\x01\b\x11\x1A#-27;AHN[b\x8B\x8D\x8F\x94\x9F\xA8\xB0\xB3\xBC\xCE\xD1\xD6\x00\x00\x00\x00\x00\x00\x01\x01\x00\x00\x00\x00\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xD8"
  end

  test "converts a color to a red, green and blue value" do
    assert Colorscheme.Terminal.color_to_rgb("BFBFBF") == [0.7490196078, 0.7490196078, 0.7490196078]
  end

  test "converts a color to a bas64 encoded string" do
    assert Colorscheme.Terminal.color_to_base64_encoded_string("222222") == "YnBsaXN0MDDUAQIDBAUGFRZYJHZlcnNpb25YJG9iamVjdHNZJGFyY2hpdmVyVCR0b3AS\n\tAAGGoKMHCA9VJG51bGzTCQoLDA0OVU5TUkdCXE5TQ29sb3JTcGFjZVYkY2xhc3NPECYw\n\tLjEzMzMzMzMzMzMgMC4xMzMzMzMzMzMzIDAuMTMzMzMzMzMzMwAQAYAC0hAREhNaJGNs\n\tYXNzbmFtZVgkY2xhc3Nlc1dOU0NvbG9yohIUWE5TT2JqZWN0XxAPTlNLZXllZEFyY2hp\n\tdmVy0RcYVHJvb3SAAQgRGiMtMjc7QUhOW2KLjY+Un6iws7zO0dYAAAAAAAABAQAAAAAA\n\tAAAZAAAAAAAAAAAAAAAAAAAA2A=="
    assert Colorscheme.Terminal.color_to_base64_encoded_string("222223") == "YnBsaXN0MDDUAQIDBAUGFRZYJHZlcnNpb25YJG9iamVjdHNZJGFyY2hpdmVyVCR0b3AS\n\tAAGGoKMHCA9VJG51bGzTCQoLDA0OVU5TUkdCXE5TQ29sb3JTcGFjZVYkY2xhc3NPECYw\n\tLjEzMzMzMzMzMzMgMC4xMzMzMzMzMzMzIDAuMTM3MjU0OTAyABABgALSEBESE1okY2xh\n\tc3NuYW1lWCRjbGFzc2VzV05TQ29sb3KiEhRYTlNPYmplY3RfEA9OU0tleWVkQXJjaGl2\n\tZXLRFxhUcm9vdIABCBEaIy0yNztBSE5bYouNj5SfqLCzvM7R1gAAAAAAAAEBAAAAAAAA\n\tABkAAAAAAAAAAAAAAAAAAADY"
  end
end

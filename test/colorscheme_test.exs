defmodule Colorscheme.TerminalTest do
  use ExUnit.Case
  doctest Colorscheme.Terminal

  test "creates a color scheme for Terminal.app" do
    assert Colorscheme.Terminal.to_plist(
      black: "181818",
      blue: "7CAFC2",
      bright_black: "585858",
      bright_blue: "B8B8B8",
      bright_cyan: "A16946",
      bright_green: "282828",
      bright_magenta: "E8E8E8",
      bright_red: "DC9656",
      bright_white: "F8F8F8",
      bright_yellow: "383838",
      cyan: "86C1B9",
      green: "A1B56C",
      magenta: "BA8BAF",
      red: "AB4642",
      white: "D8D8D8",
      yellow: "F7CA88",

      background: "181818",
      cursor: "D8D8D8",
      selection: "585858",
      bold_text: "D8D8D8",
      text: "D8D8D8"
    ) == File.read!("test/base16-default.dark.terminal")
  end

  test "converts a color to a binary plist" do
    assert Colorscheme.Terminal.color_to_binary_plist(~w(0.0941176471 0.0941176471 0.0941176471)) == "bplist00\xD4\x01\x02\x03\x04\x05\x06\x15\x16X$versionX$objectsY$archiverT$top\x12\x00\x01\x86\xA0\xA3\a\b\x0FU$null\xD3\t\n\v\f\r\x0EUNSRGB\\NSColorSpaceV$classO\x10'0.0941176471 0.0941176471 0.0941176471\x00\x10\x01\x80\x02\xD2\x10\x11\x12\x13Z$classnameX$classesWNSColor\xA2\x12\x14XNSObject_\x10\x0FNSKeyedArchiver\xD1\x17\x18Troot\x80\x01\b\x11\x1A#-27;AHN[b\x8C\x8E\x90\x95\xA0\xA9\xB1\xB4\xBD\xCF\xD2\xD7\x00\x00\x00\x00\x00\x00\x01\x01\x00\x00\x00\x00\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xD9"
    assert Colorscheme.Terminal.color_to_binary_plist(~w(0.6313725490 0.4117647059 0.2745098039)) == "bplist00\xD4\x01\x02\x03\x04\x05\x06\x15\x16X$versionX$objectsY$archiverT$top\x12\x00\x01\x86\xA0\xA3\a\b\x0FU$null\xD3\t\n\v\f\r\x0EUNSRGB\\NSColorSpaceV$classO\x10'0.6313725490 0.4117647059 0.2745098039\x00\x10\x01\x80\x02\xD2\x10\x11\x12\x13Z$classnameX$classesWNSColor\xA2\x12\x14XNSObject_\x10\x0FNSKeyedArchiver\xD1\x17\x18Troot\x80\x01\b\x11\x1A#-27;AHN[b\x8C\x8E\x90\x95\xA0\xA9\xB1\xB4\xBD\xCF\xD2\xD7\x00\x00\x00\x00\x00\x00\x01\x01\x00\x00\x00\x00\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xD9"
  end

  test "converts a color to a bas64 encoded string" do
    assert Colorscheme.Terminal.color_to_base64_encoded_string("181818") == "YnBsaXN0MDDUAQIDBAUGFRZYJHZlcnNpb25YJG9iamVjdHNZJGFyY2hpdmVy\n\tVCR0b3ASAAGGoKMHCA9VJG51bGzTCQoLDA0OVU5TUkdCXE5TQ29sb3JTcGFj\n\tZVYkY2xhc3NPECcwLjA5NDExNzY0NzEgMC4wOTQxMTc2NDcxIDAuMDk0MTE3\n\tNjQ3MQAQAYAC0hAREhNaJGNsYXNzbmFtZVgkY2xhc3Nlc1dOU0NvbG9yohIU\n\tWE5TT2JqZWN0XxAPTlNLZXllZEFyY2hpdmVy0RcYVHJvb3SAAQgRGiMtMjc7\n\tQUhOW2KMjpCVoKmxtL3P0tcAAAAAAAABAQAAAAAAAAAZAAAAAAAAAAAAAAAA\n\tAAAA2Q=="
    assert Colorscheme.Terminal.color_to_base64_encoded_string("A16946") == "YnBsaXN0MDDUAQIDBAUGFRZYJHZlcnNpb25YJG9iamVjdHNZJGFyY2hpdmVy\n\tVCR0b3ASAAGGoKMHCA9VJG51bGzTCQoLDA0OVU5TUkdCXE5TQ29sb3JTcGFj\n\tZVYkY2xhc3NPECcwLjYzMTM3MjU0OTAgMC40MTE3NjQ3MDU5IDAuMjc0NTA5\n\tODAzOQAQAYAC0hAREhNaJGNsYXNzbmFtZVgkY2xhc3Nlc1dOU0NvbG9yohIU\n\tWE5TT2JqZWN0XxAPTlNLZXllZEFyY2hpdmVy0RcYVHJvb3SAAQgRGiMtMjc7\n\tQUhOW2KMjpCVoKmxtL3P0tcAAAAAAAABAQAAAAAAAAAZAAAAAAAAAAAAAAAA\n\tAAAA2Q=="
  end

  test "converts color atoms to color names for Terminal.app" do
    assert Colorscheme.Terminal.color_name(:black) == "ANSIBlackColor"
    assert Colorscheme.Terminal.color_name(:red) == "ANSIRedColor"
    assert Colorscheme.Terminal.color_name(:green) == "ANSIGreenColor"
    assert Colorscheme.Terminal.color_name(:yellow) == "ANSIYellowColor"
    assert Colorscheme.Terminal.color_name(:blue) == "ANSIBlueColor"
    assert Colorscheme.Terminal.color_name(:magenta) == "ANSIMagentaColor"
    assert Colorscheme.Terminal.color_name(:cyan) == "ANSICyanColor"
    assert Colorscheme.Terminal.color_name(:white) == "ANSIWhiteColor"

    assert Colorscheme.Terminal.color_name(:bright_black) == "ANSIBrightBlackColor"
    assert Colorscheme.Terminal.color_name(:bright_red) == "ANSIBrightRedColor"
    assert Colorscheme.Terminal.color_name(:bright_green) == "ANSIBrightGreenColor"
    assert Colorscheme.Terminal.color_name(:bright_yellow) == "ANSIBrightYellowColor"
    assert Colorscheme.Terminal.color_name(:bright_blue) == "ANSIBrightBlueColor"
    assert Colorscheme.Terminal.color_name(:bright_magenta) == "ANSIBrightMagentaColor"
    assert Colorscheme.Terminal.color_name(:bright_cyan) == "ANSIBrightCyanColor"
    assert Colorscheme.Terminal.color_name(:bright_white) == "ANSIBrightWhiteColor"

    assert Colorscheme.Terminal.color_name(:background) == "BackgroundColor"
    assert Colorscheme.Terminal.color_name(:cursor) == "CursorColor"
    assert Colorscheme.Terminal.color_name(:selection) == "SelectionColor"
    assert Colorscheme.Terminal.color_name(:bold_text) == "TextBoldColor"
    assert Colorscheme.Terminal.color_name(:text) == "TextColor"
  end
end

defmodule Colorscheme.Iterm2Test do
  use ExUnit.Case
  doctest Colorscheme.Terminal

  test "creates a color scheme for iTerm2" do
    assert Colorscheme.Iterm2.to_plist(
      black: "181818",
      red: "AB4642",
      bright_green: "282828",
      bright_yellow: "383838",
      bright_blue: "B8B8B8",
      bright_magenta: "E8E8E8",
      bright_cyan: "A16946",
      bright_white: "F8F8F8",
      green: "A1B56C",
      yellow: "F7CA88",
      blue: "7CAFC2",
      magenta: "BA8BAF",
      cyan: "86C1B9",
      white: "D8D8D8",
      bright_black: "585858",
      bright_red: "DC9656",

      background: "181818",
      bold_text: "D8D8D8",
      cursor: "D8D8D8",
      text: "D8D8D8",
      selection: "383838"
    ) == File.read!("test/base16-default.dark.itermcolors")
  end

  test "converts color atoms to color names for iTerm2" do
    assert Colorscheme.Iterm2.color_name(:black) == "Ansi 0 Color"
    assert Colorscheme.Iterm2.color_name(:red) == "Ansi 1 Color"
    assert Colorscheme.Iterm2.color_name(:green) == "Ansi 2 Color"
    assert Colorscheme.Iterm2.color_name(:yellow) == "Ansi 3 Color"
    assert Colorscheme.Iterm2.color_name(:blue) == "Ansi 4 Color"
    assert Colorscheme.Iterm2.color_name(:magenta) == "Ansi 5 Color"
    assert Colorscheme.Iterm2.color_name(:cyan) == "Ansi 6 Color"
    assert Colorscheme.Iterm2.color_name(:white) == "Ansi 7 Color"

    assert Colorscheme.Iterm2.color_name(:bright_black) == "Ansi 8 Color"
    assert Colorscheme.Iterm2.color_name(:bright_red) == "Ansi 9 Color"
    assert Colorscheme.Iterm2.color_name(:bright_green) == "Ansi 10 Color"
    assert Colorscheme.Iterm2.color_name(:bright_yellow) == "Ansi 11 Color"
    assert Colorscheme.Iterm2.color_name(:bright_blue) == "Ansi 12 Color"
    assert Colorscheme.Iterm2.color_name(:bright_magenta) == "Ansi 13 Color"
    assert Colorscheme.Iterm2.color_name(:bright_cyan) == "Ansi 14 Color"
    assert Colorscheme.Iterm2.color_name(:bright_white) == "Ansi 15 Color"

    assert Colorscheme.Iterm2.color_name(:background) == "Background Color"
    assert Colorscheme.Iterm2.color_name(:cursor) == "Cursor Color"
    assert Colorscheme.Iterm2.color_name(:selection) == "Selection Color"
    assert Colorscheme.Iterm2.color_name(:bold_text) == "Bold Color"
    assert Colorscheme.Iterm2.color_name(:text) == "Foreground Color"
  end
end

defmodule Colorscheme.ColorTest do
  use ExUnit.Case
  doctest Colorscheme.Color

  test "converts a color to a red, green and blue value" do
    assert Colorscheme.Color.to_rgb("BFBFBF") == [0.7490196078431373, 0.7490196078431373, 0.7490196078431373]
    assert Colorscheme.Color.to_rgb("A16946") == [0.6313725490196078, 0.4117647058823529, 0.27450980392156865]
  end
end

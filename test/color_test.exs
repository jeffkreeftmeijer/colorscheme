defmodule Colorscheme.ColorTest do
  use ExUnit.Case
  doctest Colorscheme.Color

  test "returns the red value for a color" do
    assert Colorscheme.Color.red("FF0000") == 1
    assert Colorscheme.Color.red("0F0000") == 0.058823529411764705
    assert Colorscheme.Color.red("000000") == 0
  end

  test "returns the green value for a color" do
    assert Colorscheme.Color.green("00FF00") == 1
    assert Colorscheme.Color.green("000F00") == 0.058823529411764705
    assert Colorscheme.Color.green("000000") == 0
  end

  test "returns the blue value for a color" do
    assert Colorscheme.Color.blue("0000FF") == 1
    assert Colorscheme.Color.blue("00000F") == 0.058823529411764705
    assert Colorscheme.Color.blue("000000") == 0
  end

  test "converts a color to a red, green and blue value" do
    assert Colorscheme.Color.to_rgb("BFBFBF") == [0.7490196078431373, 0.7490196078431373, 0.7490196078431373]
    assert Colorscheme.Color.to_rgb("A16946") == [0.6313725490196078, 0.4117647058823529, 0.27450980392156865]
  end
end

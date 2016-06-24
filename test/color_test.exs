defmodule Colorscheme.ColorTest do
  use ExUnit.Case
  doctest Colorscheme.Color

  test "converts a color to a red, green and blue value" do
    assert Colorscheme.Color.to_rgb("BFBFBF") == ~w(0.7490196078 0.7490196078 0.7490196078)
    assert Colorscheme.Color.to_rgb("A16946") == ~w(0.6313725490 0.4117647059 0.2745098039)
  end
end

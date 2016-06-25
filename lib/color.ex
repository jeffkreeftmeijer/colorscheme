defmodule Colorscheme.Color do
  def red(color) do
    [red, _, _] = color |> to_rgb
    red
  end

  def green(color) do
    [_, green, _] = color |> to_rgb
    green
  end

  def blue(color) do
    [_, _, blue] = color |> to_rgb
    blue
  end

  def to_rgb(color) do
    result = Regex.scan(~r/../, color) |> List.flatten

    Enum.map(result, fn(n) ->
     {base, _} = Integer.parse(n, 16)
     base / 255
    end)
  end
end

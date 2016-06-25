defmodule Colorscheme.Color do
  def to_rgb(color) do
    result = Regex.scan(~r/../, color) |> List.flatten

    Enum.map(result, fn(n) ->
     {base, _} = Integer.parse(n, 16)
     base / 255
    end)
  end
end

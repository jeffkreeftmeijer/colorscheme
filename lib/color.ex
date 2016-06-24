defmodule Colorscheme.Color do
  def to_rgb(color) do
    result = Regex.scan(~r/../, color) |> List.flatten

    Enum.map(result, fn(n) ->
     {base, _} = Integer.parse(n, 16)
     base / 255 |> float_to_formatted_string
    end)
  end

  defp float_to_formatted_string(float) do
    :io_lib.format("~.10f", [float]) |> to_string
  end
end

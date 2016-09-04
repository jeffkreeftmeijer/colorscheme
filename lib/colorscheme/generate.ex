defmodule Mix.Tasks.Generate do
  use Mix.Task

  def run(path) do
    basename = Path.basename(path, ".exs")

    Mix.Config.read!(path)
    |> Enum.each(fn({key, colors}) ->
      configuration = colors |> Colorscheme.Terminal.to_configuration
      "#{basename}-#{key}.terminal" |> File.write!(configuration)

      configuration = colors |> Colorscheme.Iterm2.to_configuration
      "#{basename}-#{key}.itermcolors" |> File.write!(configuration)
    end)
  end
end

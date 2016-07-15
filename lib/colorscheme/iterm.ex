defmodule Colorscheme.Iterm2 do
  def to_configuration(colors) do
    EEx.eval_string("""
    <?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
    <plist version=\"1.0\">
    <dict><%= for {key, color} <- colors do %>
    	<key><%= Colorscheme.Iterm2.color_name(key) %></key>
    	<dict>
    		<key>Color Space</key>
    		<string>sRGB</string>
    		<key>Blue Component</key>
    		<real><%= color |> Color.blue %></real>
    		<key>Green Component</key>
    		<real><%= color |> Color.green %></real>
    		<key>Red Component</key>
    		<real><%= color |> Color.red %></real>
    	</dict><% end %>
    </dict>
    </plist>
    """, colors: colors)
  end

  def color_name(:black), do: "Ansi 0 Color"
  def color_name(:red), do: "Ansi 1 Color"
  def color_name(:green), do: "Ansi 2 Color"
  def color_name(:yellow), do: "Ansi 3 Color"
  def color_name(:blue), do: "Ansi 4 Color"
  def color_name(:magenta), do: "Ansi 5 Color"
  def color_name(:cyan), do: "Ansi 6 Color"
  def color_name(:white), do: "Ansi 7 Color"
  def color_name(:bright_black), do: "Ansi 8 Color"
  def color_name(:bright_red), do: "Ansi 9 Color"
  def color_name(:bright_green), do: "Ansi 10 Color"
  def color_name(:bright_yellow), do: "Ansi 11 Color"
  def color_name(:bright_blue), do: "Ansi 12 Color"
  def color_name(:bright_magenta), do: "Ansi 13 Color"
  def color_name(:bright_cyan), do: "Ansi 14 Color"
  def color_name(:bright_white), do: "Ansi 15 Color"
  def color_name(:background), do: "Background Color"
  def color_name(:cursor), do: "Cursor Color"
  def color_name(:selection), do: "Selection Color"
  def color_name(:bold_text), do: "Bold Color"
  def color_name(:text), do: "Foreground Color"
end

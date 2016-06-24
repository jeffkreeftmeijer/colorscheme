defmodule Colorscheme.Terminal do
  def to_plist(colors) do
    EEx.eval_string("""
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
    	<key>ANSIBlackColor</key>
    	<data>
    	<%= Colorscheme.Terminal.color_to_base64_encoded_string(colors[:black]) %>
    	</data>
    	<key>ANSIBlueColor</key>
    	<data>
    	<%= Colorscheme.Terminal.color_to_base64_encoded_string(colors[:blue]) %>
    	</data>
    	<key>ANSIBrightBlackColor</key>
    	<data>
    	<%= Colorscheme.Terminal.color_to_base64_encoded_string(colors[:bright_black]) %>
    	</data>
    	<key>ANSIBrightBlueColor</key>
    	<data>
    	<%= Colorscheme.Terminal.color_to_base64_encoded_string(colors[:bright_blue]) %>
    	</data>
    	<key>ANSIBrightCyanColor</key>
    	<data>
    	<%= Colorscheme.Terminal.color_to_base64_encoded_string(colors[:bright_cyan]) %>
    	</data>
    	<key>ANSIBrightGreenColor</key>
    	<data>
    	<%= Colorscheme.Terminal.color_to_base64_encoded_string(colors[:bright_green]) %>
    	</data>
    	<key>ANSIBrightMagentaColor</key>
    	<data>
    	<%= Colorscheme.Terminal.color_to_base64_encoded_string(colors[:bright_magenta]) %>
    	</data>
    	<key>ANSIBrightRedColor</key>
    	<data>
    	<%= Colorscheme.Terminal.color_to_base64_encoded_string(colors[:bright_red]) %>
    	</data>
    	<key>ANSIBrightWhiteColor</key>
    	<data>
    	<%= Colorscheme.Terminal.color_to_base64_encoded_string(colors[:bright_white]) %>
    	</data>
    	<key>ANSIBrightYellowColor</key>
    	<data>
    	<%= Colorscheme.Terminal.color_to_base64_encoded_string(colors[:bright_yellow]) %>
    	</data>
    	<key>ANSICyanColor</key>
    	<data>
    	<%= Colorscheme.Terminal.color_to_base64_encoded_string(colors[:cyan]) %>
    	</data>
    	<key>ANSIGreenColor</key>
    	<data>
    	<%= Colorscheme.Terminal.color_to_base64_encoded_string(colors[:green]) %>
    	</data>
    	<key>ANSIMagentaColor</key>
    	<data>
    	<%= Colorscheme.Terminal.color_to_base64_encoded_string(colors[:magenta]) %>
    	</data>
    	<key>ANSIRedColor</key>
    	<data>
    	<%= Colorscheme.Terminal.color_to_base64_encoded_string(colors[:red]) %>
    	</data>
    	<key>ANSIWhiteColor</key>
    	<data>
    	<%= Colorscheme.Terminal.color_to_base64_encoded_string(colors[:white]) %>
    	</data>
    	<key>ANSIYellowColor</key>
    	<data>
    	<%= Colorscheme.Terminal.color_to_base64_encoded_string(colors[:yellow]) %>
    	</data>
    	<key>BackgroundColor</key>
    	<data>
    	<%= Colorscheme.Terminal.color_to_base64_encoded_string(colors[:background]) %>
    	</data>
    	<key>CursorColor</key>
    	<data>
    	<%= Colorscheme.Terminal.color_to_base64_encoded_string(colors[:cursor]) %>
    	</data>
    	<key>SelectionColor</key>
    	<data>
    	<%= Colorscheme.Terminal.color_to_base64_encoded_string(colors[:selection]) %>
    	</data>
    	<key>TextBoldColor</key>
    	<data>
    	<%= Colorscheme.Terminal.color_to_base64_encoded_string(colors[:bold_text]) %>
    	</data>
    	<key>TextColor</key>
    	<data>
    	<%= Colorscheme.Terminal.color_to_base64_encoded_string(colors[:text]) %>
    	</data>
    	<key>ProfileCurrentVersion</key>
    	<real>2.02</real>
    	<key>type</key>
    	<string>Window Settings</string>
    </dict>
    </plist>
    """, colors: colors)
  end

  def color_to_binary_plist([red, green, blue]) do
    "bplist00\xD4\x01\x02\x03\x04\x05\x06\x15\x16X$versionX$objectsY$archiverT$top\x12\x00\x01\x86\xA0\xA3\a\b\x0FU$null\xD3\t\n\v\f\r\x0EUNSRGB\\NSColorSpaceV$classO\x10'#{red} #{green} #{blue}\x00\x10\x01\x80\x02\xD2\x10\x11\x12\x13Z$classnameX$classesWNSColor\xA2\x12\x14XNSObject_\x10\x0FNSKeyedArchiver\xD1\x17\x18Troot\x80\x01\b\x11\x1A#-27;AHN[b\x8C\x8E\x90\x95\xA0\xA9\xB1\xB4\xBD\xCF\xD2\xD7\x00\x00\x00\x00\x00\x00\x01\x01\x00\x00\x00\x00\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xD9"
  end

  def color_to_rgb(color) do
    result = Regex.scan(~r/../, color) |> List.flatten

    Enum.map(result, fn(n) ->
     {base, _} = Integer.parse(n, 16)
     base / 255 |> float_to_formatted_string
    end)
  end

  def color_to_base64_encoded_string(color) do
    encoded = color 
              |> color_to_rgb
              |> Colorscheme.Terminal.color_to_binary_plist
              |> Base.encode64

    Regex.scan(~r/.{0,60}/, encoded)
    |> List.flatten 
    |> Enum.filter(fn(part) ->
      String.length(part) > 0
    end)
    |> Enum.join("\n\t")
  end

  defp float_to_formatted_string(float) do
    :io_lib.format("~.10f", [float]) |> to_string
  end

  def color_name(:black), do: "ANSIBlackColor"
  def color_name(:red), do: "ANSIRedColor"
  def color_name(:green), do: "ANSIGreenColor"
  def color_name(:yellow), do: "ANSIYellowColor"
  def color_name(:blue), do: "ANSIBlueColor"
  def color_name(:magenta), do: "ANSIMagentaColor"
  def color_name(:cyan), do: "ANSICyanColor"
  def color_name(:white), do: "ANSIWhiteColor"
  def color_name(:bright_black), do: "ANSIBrightBlackColor"
  def color_name(:bright_red), do: "ANSIBrightRedColor"
  def color_name(:bright_green), do: "ANSIBrightGreenColor"
  def color_name(:bright_yellow), do: "ANSIBrightYellowColor"
  def color_name(:bright_blue), do: "ANSIBrightBlueColor"
  def color_name(:bright_magenta), do: "ANSIBrightMagentaColor"
  def color_name(:bright_cyan), do: "ANSIBrightCyanColor"
  def color_name(:bright_white), do: "ANSIBrightWhiteColor"
  def color_name(:background), do: "BackgroundColor"
  def color_name(:cursor), do: "CursorColor"
  def color_name(:selection), do: "SelectionColor"
  def color_name(:bold_text), do: "TextBoldColor"
  def color_name(:text), do: "TextColor"
end

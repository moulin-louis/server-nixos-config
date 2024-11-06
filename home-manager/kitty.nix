{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "FiraCode Nerd Font Mono";
      bold_font = "FiraCode Nerd Font Mono Bold";
      bold_italic_font = "FiraCode Nerd Font Mono Bold Italic";
      font_size = "9.5";
      #Catppuccin Macchiato Theme
      foreground = "#CAD3F5";
      background = "#24273A";
      selection_foreground = "#24273A";
      selection_background = "#F4DBD6";

      # Cursor colors
      cursor = "#F4DBD6";
      cursor_text_color = "#24273A";

      # URL underline color when hovering with mouse
      url_color = "#F4DBD6";

      # Kitty window border colors
      active_border_color = "#B7BDF8";
      inactive_border_color = "#6E738D";
      bell_border_color = "#EED49F";

      # OS Window titlebar colors
      wayland_titlebar_color = "system";
      macos_titlebar_color = "system";

      # Tab bar colors
      active_tab_foreground = "#181926";
      active_tab_background = "#C6A0F6";
      inactive_tab_foreground = "#CAD3F5";
      inactive_tab_background = "#1E2030";
      tab_bar_background = "#181926";

      # Colors for marks
      mark1_foreground = "#24273A";
      mark1_background = "#B7BDF8";
      mark2_foreground = "#24273A";
      mark2_background = "#C6A0F6";
      mark3_foreground = "#24273A";
      mark3_background = "#7DC4E4";

      # The 16 terminal colors
      # Black
      color0 = "#494D64";
      color8 = "#5B6078";
      # Red
      color1 = "#ED8796";
      color9 = "#ED8796";
      # Green
      color2 = "#A6DA95";
      color10 = "#A6DA95";
      # Yellow
      color3 = "#EED49F";
      color11 = "#EED49F";
      # Blue
      color4 = "#8AADF4";
      color12 = "#8AADF4";
      # Magenta
      color5 = "#F5BDE6";
      color13 = "#F5BDE6";
      # Cyan
      color6 = "#8BD5CA";
      color14 = "#8BD5CA";
      # White
      color7 = "#B8C0E0";
      color15 = "#A5ADCB";
    };
  };
}

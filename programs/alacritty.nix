{ pkgs }:
{
  enable = true;

  settings = {
    env = {
      TERM = "xterm-256color";
    };
    shell = {
      program = "zsh";
      args = [ "-l" "-c" "tmux" "new-session" "-A" "-s" "main" ];
    };
    font = {
      size = 14;
      normal = {
        family = "SauceCodePro Nerd Font";
        style = "Regular";
      };
      bold = {
        family = "SauceCodePro Nerd Font";
        style = "Bold";
      };
      italic = {
        family = "SauceCodePro Nerd Font";
        style = "Italic";
      };
    };
    colors = {
      # Default colors
      primary = {
        background = "0x192330";
        foreground = "0xcdcecf";
      };
      # Normal colors
      normal = {
        black =   "0x393b44";
        red =     "0xc94f6d";
        green =   "0x81b29a";
        yellow =  "0xdbc074";
        blue =    "0x719cd6";
        magenta = "0x9d79d6";
        cyan =    "0x63cdcf";
        white =   "0xdfdfe0";
      };
      # Bright colors
      bright = {
        black =   "0x575860";
        red =     "0xd16983";
        green =   "0x8ebaa4";
        yellow =  "0xe0c989";
        blue =    "0x86abdc";
        magenta = "0xbaa1e2";
        cyan =    "0x7ad5d6";
        white =   "0xe4e4e5";
      };
      indexed_colors = [
        { index = 16; color = "0xf4a261"; }
        { index = 17; color = "0xd67ad2"; }
      ];
    };
  };
}

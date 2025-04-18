{ pkgs, ... }:
{
  stylix = {

    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

    image = pkgs.fetchurl {
      #Single Screen
      #url = "https://wallpaperaccess.com/full/1267226.jpg";
      #sha256 = "3HKLrOKI2FpvTjatspp3Q+ZEHRE7M1APSHa09tl7TCk=";

      #Dual screen
      url = "https://wallpaperaccess.com/full/1512143.jpg";
      sha256 = "FPpJ3sqlz2P+D7eSdfs8WAQw033hjvdzLDiSzuMkMaw=";
    };
    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };

}

{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/Pictures/wallpapers/anime/119437.jpg"
        "~/Pictures/wallpapers/anime/191183.jpg"
        "~/Pictures/wallpapers/anime/204334.jpg"
      ];
      wallpaper = [
        # By display
        # {
        #   monitor = "DP-2";
        #   path = "~/wallpapers/wallpaper2.jpg";
        # }
        # By default/fallback
        {
          monitor = "";
          path = "~/Pictures/wallpapers/anime/119437.jpg";
        }
      ];
    };
  };
}

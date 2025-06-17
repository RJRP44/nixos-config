{ pkgs, ... }: 
{
  home.packages = with pkgs; [
    # discord
    xdg-desktop-portal-gtk
    (discord.override { 
     withVencord = false;
    })
  ];
  #xdg.configFile."Vencord/themes/gruvbox.theme.css".source = ./gruvbox.css;
}

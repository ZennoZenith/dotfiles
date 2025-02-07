let fonts_url = [
  https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/0xProto.zip
  https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Agave.zip
  https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip
  https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaMono.zip
  https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
  https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip
  https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
  https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Mononoki.zip
  https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/RobotoMono.zip
  https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/NerdFontsSymbolsOnly.zip
]

mkdir ~/.fonts

cd ~/.fonts
$fonts_url | each {|e| wget $e }

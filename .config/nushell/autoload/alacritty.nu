let host = $nu.os-info | get name 
if $host == 'windows' {
  $env.ALACRITTY_CONFIG_PATH = $'C:\Users\($env.USERNAME)\AppData\Roaming\alacritty'
} else if $host == 'linux' {
  $env.ALACRITTY_CONFIG_PATH = $'/home/($env.USER)/.config/alacritty'
}

# let import_list = open $'($env.ALACRITTY_CONFIG_PATH)\alacritty.toml' | get import 
# mut current_theme = ''
# # $import_list | each { 
# #   print $in
# # }

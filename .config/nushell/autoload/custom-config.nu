$env.config.edit_mode = 'vi'
$env.config.buffer_editor = "hx"
$env.config.show_banner = false # true or false to enable or disable the welcome banner at startup
$env.config.history = {
  file_format: sqlite
  max_size: 1_000_000
  sync_on_enter: true
  isolation: true
}

$env.EDITOR = 'hx'

module init-custom {
  def app-init [] {
      const autoload_path = ($nu.config-path | path dirname | path join 'inits')
      mkdir $autoload_path
      zoxide init nushell | save -f ($autoload_path | path join "zoxide.nu")
      atuin init nu | save -f ($autoload_path | path join "atuin.nu")
      starship init nu | save -f ($autoload_path | path join "starship.nu")
      keychain_init
  }

  def init-completions [] {
      const custom_compeltion_dir = ($nu.config-path | path dirname | path join 'completions')
      mkdir $custom_compeltion_dir

      pueue completions nushell | save -f ($custom_compeltion_dir | path join "pueue.nu")
      atuin gen-completions --shell nushell | save -f ($custom_compeltion_dir | path join "atuin.nu")

  }

  export def init [] {
      mkdir ($nu.config-path | path dirname | path join 'inits')
      app-init
      init-completions
  }
  
}



def show_banner [] {
    let ellie = [
        "     __  ,"
        " .--()°'.'"
        "'|, . ,'  "
        ' !_-(_\   '
    ]
    let s_mem = (sys mem)
    let s_ho = (sys host)
    print $"(ansi reset)(ansi green)($ellie.0)"
    print $"(ansi green)($ellie.1)  (ansi yellow) (ansi yellow_bold)Nushell (ansi reset)(ansi yellow)v(version | get version)(ansi reset)"
    print $"(ansi green)($ellie.2)  (ansi light_blue) (ansi light_blue_bold)RAM (ansi reset)(ansi light_blue)($s_mem.used) / ($s_mem.total)(ansi reset)"
    print $"(ansi green)($ellie.3)  (ansi light_purple)ﮫ (ansi light_purple_bold)Uptime (ansi reset)(ansi light_purple)($s_ho.uptime)(ansi reset)"
}


show_banner

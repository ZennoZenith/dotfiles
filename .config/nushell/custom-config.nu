$env.config.history = {
  file_format: sqlite
  max_size: 1_000_000
  sync_on_enter: true
  isolation: true
}

$env.config.edit_mode = 'vi'
$env.config.buffer_editor = "hx"
$env.config.show_banner = false # true or false to enable or disable the welcome banner at startup

$env.EDITOR = 'hx'

## HACK: some error happens when trying to convert __zoxide_hookedin zoxide init 
$env.ENV_CONVERSIONS.__zoxide_hooked = {
    from_string: { |s| $s | into bool }
    to_string: { |v| $v | into string }
}

def app-init [] {
    const vendor_path = $nu.data-dir | path join "vendor/autoload"
    mkdir $vendor_path
    zoxide init nushell | save -f ($vendor_path | path join "zoxide.nu")
    atuin init nu | save -f ($vendor_path | path join "atuin.nu")
    keychain_init
}

def init-completions [] {
    mkdir ($nu.data-dir | path join "nushell/completions")

    pueue completions nushell | save -f ($nu.data-dir | path join "nushell/completions/pueue.nu")
    atuin gen-completions --shell nushell | save -f ($nu.data-dir | path join "nushell/completions/atuin.nu")

}

def init [] {
    mkdir ($nu.data-dir | path join "vendor/autoload")
    starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

    app-init
    init-completions
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

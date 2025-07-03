
def app-init [] {
    const autoload_path = ($nu.home-path | path join '.local/share/nushell/vendor/autoload')
    mkdir $autoload_path
    zoxide init nushell | save -f ($autoload_path | path join "zoxide.nu")
    atuin init nu | save -f ($autoload_path | path join "atuin.nu")
    starship init nu | save -f ($autoload_path | path join "starship.nu")
    # keychain_init
}

def init-completions [] {
    const custom_compeltion_dir = ($nu.config-path | path dirname | path join 'completions')
    mkdir $custom_compeltion_dir

    pueue completions nushell | save -f ($custom_compeltion_dir | path join "pueue.nu")
    atuin gen-completions --shell nushell | save -f ($custom_compeltion_dir | path join "atuin.nu")
}

export def init [] {
    app-init
    init-completions
}


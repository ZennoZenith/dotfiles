use std/util "path add"
$env.ATUIN_PATH = $'($nu.home-path)/.atuin/bin'
path add $env.ATUIN_PATH

source ../inits/atuin.nu

$env.ATUIN_NOBIND = true

#bind to ctrl-r in emacs, vi_normal and vi_insert modes, add any other bindings you want here too
export-env {
    if ('atuin' not-in ($env.config.keybindings | get name) ) {
        $env.config.keybindings = $env.config.keybindings | append {
            name: atuin
            modifier: control
            keycode: char_r
            mode: [emacs, vi_normal, vi_insert]
            event: { send: executehostcommand cmd: (_atuin_search_cmd) }
        }
    }
}

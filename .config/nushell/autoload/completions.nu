const custom_compeltion_dir = ($nu.config-path | path dirname | path join 'completions')
const compeltion_dir = ($nu.data-dir | path join "nushell/completions")

source ($custom_compeltion_dir | path join 'zellij-completions.nu')
source ($custom_compeltion_dir | path join 'ssh-completions.nu')

source ($compeltion_dir | path join 'pueue.nu')
source ($compeltion_dir | path join 'atuin.nu')

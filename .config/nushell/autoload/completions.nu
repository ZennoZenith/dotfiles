const NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'completions')
    ($nu.data-dir | path join "nushell/completions")
]

# ($nu.config-path | path dirname | path join 'completions')
source zellij-completions.nu
source ssh-completions.nu

# ($nu.data-dir | path join "nushell/completions")
source pueue.nu
source atuin.nu

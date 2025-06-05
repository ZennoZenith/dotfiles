# use std/util "path add"

# $env.FNM_PATH = $'($nu.home-path)/.local/share/fnm'

# path add $env.FNM_PATH

# load-env (fnm env --shell bash | lines | str replace 'export ' '' | str replace -a '"' '' | split column '=' | rename name value | where name != "FNM_ARCH" and name != "PATH" | reduce -f {} {|it, acc| $acc | upsert $it.name $it.value })

# path add $"($env.FNM_MULTISHELL_PATH)/bin"

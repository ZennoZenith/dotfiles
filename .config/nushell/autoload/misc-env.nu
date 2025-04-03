# =============================== ENV =========================================
$env.LOCAL_BIN = $'($nu.home-path)/.local/bin'
$env.CARGO_PATH = $'($nu.home-path)/.cargo/bin'
$env.DENO_INSTALL = $'($nu.home-path)/.deno'
$env.BUN_INSTALL = $'($nu.home-path)/.bun'
$env.NVM_DIR = $'($nu.home-path)/.nvm'
$env.BUN_PATH = $'($env.BUN_INSTALL)/bin'
$env.GO_PATH = '/usr/local/go/bin'
$env.GO_BINS = $'($nu.home-path)/go/bin'


# =============================== PATH ========================================
let list_of_paths = [
  $env.LOCAL_BIN
  /home/linuxbrew/.linuxbrew/bin 
  /home/linuxbrew/.linuxbrew/sbin 
  $env.CARGO_PATH
  $"($env.DENO_INSTALL)/bin"
  $env.BUN_PATH
  $env.GO_PATH
  $env.GO_BINS
   # etc.
]

use std/util "path add"
path add ...$list_of_paths
# $env.path ++= ["~/.local/bin"]

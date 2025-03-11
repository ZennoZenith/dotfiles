def --env sshr [ssh_keys?: list<string>] {
  let ssh_keys = ls -s $'($nu.home-path)/.ssh' | get name | where { |s| ($s | str starts-with 'id_') and  not ($s | str ends-with '.pub') }

  let results = if ($ssh_keys | length) == 1 {
    $ssh_keys | str join " "
  } else {
    $ssh_keys | to text | fzf --no-sort --multi | lines | str join " "
  }

  ## if default shell is fish 
  # parse "set -e {k}; set -x -U {k} {v};"
  ## if default shell is nushell 
  # parse "{k}={v}; export {k2};"

  
  let envs = keychain --eval --quiet $results
      | lines
      | where not ($it | is-empty)
      | parse "{k}={v}; export {k2};"
      | select k v

   $envs
      | transpose --header-row
      | into record
      | load-env

  const vendor_path = $nu.data-dir | path join "vendor/autoload"

  if not ($vendor_path | path exists) {
    mkdir $vendor_path
  }

  const keychain_vendor = $vendor_path | path join "keychain.nu"

  $envs | each { |e| $'$env.($e.k) = "($e.v)"'} | to text | save -f $keychain_vendor
}

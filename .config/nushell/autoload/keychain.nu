def --env sshr [ssh_keys?: list<string>] {
  let ssh_keys = ls -s $'($nu.home-path)/.ssh' | get name | where { |s| ($s | str starts-with 'id_') and  not ($s | str ends-with '.pub') }

  let results = if ($ssh_keys | length) == 1 {
    $ssh_keys | str join " "
  } else {
    $ssh_keys | to text | fzf --no-sort --multi | lines | str join " "
  }

  keychain --eval --quiet id_ed25519
      | lines
      | where not ($it | is-empty)
      | parse "set -e {k}; set -x -U {k} {v};"
      | select k v
      | transpose --header-row
      | into record
      | load-env
}

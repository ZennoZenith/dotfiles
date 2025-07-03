const keychain_env_dir = $'($nu.home-path)/.local/share/keychain'
const keychain_env_file = $'($keychain_env_dir)/env'

def parse_keychain [keychain_text: string] {
  # eg:
  # set -e SSH_AUTH_SOCK; set -x -U SSH_AUTH_SOCK /tmp/ssh-XXXXXXzzE1oz/agent.96531;
  # set -e SSH_AGENT_PID; set -x -U SSH_AGENT_PID 96532;
 
  ## if default shell is fish 
  let parsed = $keychain_text | parse "set -e {k}; set -x -U {k} {v};"
  if ( $parsed | is-not-empty ) {
    return $parsed
  }

  ## if default shell is nushell 
  let parsed = $keychain_text | parse "{k}={v}; export {k2};"
  if ( $parsed | is-not-empty ) {
    return $parsed
  }
  
  error make {
    msg: $"Cannot parse ($keychain_text)"
    label: {
      text: ""
      span: ""
    }
  }
} 

export def --env load_keychian [] {
  if not ( $keychain_env_file | path exists ) {
    return
  } 

  let envs = open --raw $keychain_env_file
    | lines
    | parse "{k}, {v}" 
    | transpose --header-row
    | into record
    | load-env
}


export def --env sshr [ssh_keys?: list<string>] {
  let ssh_keys = ls -s $'($nu.home-path)/.ssh' | get name | where { |s| ($s | str starts-with 'id_') and  not ($s | str ends-with '.pub') }

  let results = if ($ssh_keys | length) == 1 {
    $ssh_keys | str join " "
  } else {
    $ssh_keys | to text | fzf --no-sort --multi | lines | str join " "
  }

  
  let envs = keychain --eval --quiet $results
      | lines
      | where not ($it | is-empty)
      | each { parse_keychain $in }
      | reduce {|it, acc| $acc | append $it }
      | select k v

  ## Done seperatly because envs will be used later as is
  $envs 
      | transpose --header-row
      | into record
      | load-env

  if not ($keychain_env_dir | path exists) {
    ^mkdir -p $keychain_env_dir
  }

  $envs | each { |e| $'($e.k), ($e.v)'} | to text | save -f $keychain_env_file 
}


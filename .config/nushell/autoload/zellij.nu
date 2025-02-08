alias zl = zellij

def zll [
  --layout (-l): string
  --session (-s): string
  --default (-d)
] {
  let layouts = (
    ls ~/.config/zellij/layouts/
    | get name
    | each { $in | path basename  }
    | where { $in | str ends-with '.kdl' }
    | each { $in | str replace '.kdl' '' }
  )

  let layout = (
    if $default { "default" }
    else if ($layout != null) { $layout }
    else {
      $layouts | str join "\n" | fzf
    }
  )

  if ($session == null) {
    zellij --new-session-with-layout $layout
  } else {
    zellij --new-session-with-layout $layout --session $session
  }

}

def zl [
  session?: string
] {
  zll -l "coding" -s $session
}

def zls [] {
  zellij list-sessions
}

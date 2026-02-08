let tools = [ rg bat fd fzf starship k9s ]

let results = $tools | each { |tool|
          # new record
          { tool: $tool
            is-installed: ($tool | _is-installed)
          }
       }

if not ($results | get is-installed | all {|it| $it}) {
    $results | each { |r| $r | upsert is-installed ($r.is-installed | _to-emoji) } | print
}

def _is-installed []: string -> bool {
  which $in | is-not-empty
}

def _to-emoji []: bool -> string {
  if $in { '✅' } else { '❌' }
}

def _is_running_in_intellij []: nothing -> bool {
  return (('TERMINAL_EMULATOR' in ($env | columns)) and $env.TERMINAL_EMULATOR == "JetBrains-JediTerm")
}

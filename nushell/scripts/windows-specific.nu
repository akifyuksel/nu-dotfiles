def launch-intellij [project_path: string] {
  let intellij_start_command = ['"' $'($env.INTELLIJ_ROOT_DIR)\bin\idea64.exe' '"'] | str join
  let quoted_project_path = ["'" $project_path "'"] | str join

  # 'run-external' to run the windows version of 'start' (start.exe) instead of the nushell command
  # 'start' is a standard windows command to launch a new detached process (i.e. not linked to the lifecycle of the current terminal)
  # the first quoted argument to start is assumed to be the title for a new console window which we do not use but which must be provided so we enter an empty string: ""
  run-external start '""' $intellij_start_command $quoted_project_path
}

def copy-to-clipboard [] {
    run-external powershell '-c' $'Set-Clipboard -Value ($in)'
}

def vpn-is-active [] {
  ipconfig | lines | where { |line| $line =~ 'IPv4.*\: 10\.179' } | is-not-empty
}
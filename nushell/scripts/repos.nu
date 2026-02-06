def _list-repos [] {
  ls --short-names $git_repos_dir | where type == dir | get name | to text
}

alias repos = cd $git_repos_dir

# --env so that the call to the cd command and setjava persists to the caller of this command, cd sets $env.PWD
def --env repo [query: string = ""] {
  let selectedRepo = _list-repos | fzf --query=$'($query)' --select-1
  if ( $selectedRepo | is-empty ) {
    print 'No repository selected.'
    return
  }
  let directory: string = [ $git_repos_dir $selectedRepo ] | path join
  cd $directory
}

export def clone [query: string = ''] {
    let repos = fetch-repos
    let repo_name = $repos | get name | to text | fzf --query=$'($query)' --select-1
    let repo = $repos | where name == $repo_name | first

    let clone_dir = clone-repo $repo.name $repo.remoteUrl

    let open_in_ij = [ yes no ] | input list 'Would you like to open the cloned project in Intellij?'
    if $open_in_ij == yes {
        cd $clone_dir
        ij .
    }
}

export def clone-all-repos [] {
    let repos = fetch-repos
    let current_repos = _list-repos
    let repos_to_clone = $repos | where name in repos | where name not-in $current_repos

    for repo in $repos_to_clone {
        clone-repo $repo.name $repo.remoteUrl
    }
}

export def myr [] {
    let repo_name = $env.PWD | path basename
    start $'https://github.com/akifyuksel/($repo_name)'
}

def fetch-repos []: nothing -> table {
    print 'Fetching list of Repos... (this may take a moment)'
    # use explicit subscription and project so this will still work even if the user has switched to another default
    curl -s "https://api.github.com/users/akifyuksel/repos" | from json | each { |repo| {name: $repo.name, remoteUrl: $repo.clone_url} }
}

def clone-repo [repo_name: string, remoteUrl: string]: nothing -> string {
    let clone_dir = [ $git_repos_dir $repo_name ] | path join
    git clone $remoteUrl $clone_dir
    $clone_dir
}
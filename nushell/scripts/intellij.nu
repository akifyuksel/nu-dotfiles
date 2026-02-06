def ij [repo: string = ''] {
  if ( $repo == '.' ) {
    launch-intellij .
    return
  }

  # fuzzy find a repo and open that in intellij
  let selected_repo = ( _list-repos | fzf --query=$"($repo)" --select-1 )

  if ( $selected_repo | is-empty ) {
    print 'No repository selected.'
    return 1
  }

  let full_repo_dir = [$git_repos_dir $selected_repo] | path join
  print $"Opening ($full_repo_dir) in IntelliJ ..."

  launch-intellij $full_repo_dir
}
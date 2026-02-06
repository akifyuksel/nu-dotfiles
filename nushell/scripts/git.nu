alias add = git add
alias status = git status
alias diff = git diff
alias diffs = diff --staged
alias commit = git commit
alias pull = git pull
alias push = git push
alias checkout = git checkout # old: replaced with git switch and git restore
alias restore = git restore
alias stash = git stash
alias clean = git clean
alias log = git log
alias fetch = git fetch
alias merge = git merge
alias rebase = git rebase
alias gitchmod = git update-index --chmod=+x
alias show = git show --stat --oneline

def main [] {
  if not ('.git' | path exists) {
    print 'Current directory is not a git repository'
    return
  }

  let main_branch = (
    git remote show origin
    | lines
    | where $it =~ 'HEAD branch:'
    | first
    | str replace 'HEAD branch: ' ''
    | str trim
  )
  git switch $main_branch
}

def switch [query: string = ''] {
  let branch = (
    git branch -r --format='%(refname:short)'
    | lines
    | str replace -r 'origin/(.*)' '$1'
    | where $it != "origin"
    | uniq
    | to text
    | fzf --query=$"($query)" --select-1
  )
  if ($branch | is-not-empty) {
    print $'switching to ($branch)'
    git switch $branch
  } else {
    print 'did not switch to a different branch'
  }
}
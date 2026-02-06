const filePath = path self
print $'Loading user specific config from ($filePath)'

# We cannot use $env.HOME because it is not a compile-time constant
const git_repos_dir           = '/home/akif/IdeaProjects'
const dotfiles_clone_location = $'($git_repos_dir)/nu-dotfiles'

load-env {
  'EDITOR': 'vi'
}

source ([$dotfiles_clone_location nushell main.nu] | path join)

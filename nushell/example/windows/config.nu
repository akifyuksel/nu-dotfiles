const filePath = path self
print $'Loading user specific config from ($filePath)'

# We cannot use $env.HOME because it is not a compile-time constant
const git_repos_dir           = 'C:\repos'
const dotfiles_clone_location = $'($git_repos_dir)\bronnen-dotfiles'

load-env {
  'INTELLIJ_ROOT_DIR': $'($env.USERPROFILE)\AppData\Local\Programs\IntelliJ IDEA Ultimate'
  'EDITOR': 'vi'
  # 'VPN_START_MANUALLY': 'true' # exact value does not matter, presence of the variable is enough
}

source ([$dotfiles_clone_location nushell main.nu] | path join)
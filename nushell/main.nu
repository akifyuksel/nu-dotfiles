print "🔥🔥🔥 Congratulations, you are using the Nu dotfiles nushell scripts! 🔥🔥🔥 \n"

# disable the welcome banner
$env.config.show_banner = false

const _macos_script = 'scripts/macos-specific.nu'
const _windows_script = 'scripts/windows-specific.nu'
const _linux_script = 'scripts/linux-specific.nu'
const _os_specific_script = if $nu.os-info.name == 'macos' { $_macos_script } else if $nu.os-info.name == 'linux' { $_linux_script } else { $_windows_script }
source $_os_specific_script

source scripts/initialization-checks.nu
source scripts/base-aliases.nu
source scripts/git.nu
source scripts/repos.nu
source scripts/intellij.nu
source scripts/starship.nu
source scripts/motivation.nu
use scripts/url.nu *

motivate

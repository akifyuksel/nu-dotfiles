print '🔥🔥🔥 Congratulations, you are using the personal dotfiles nushell scripts! 🔥🔥🔥'
print "Type "commands" to view a list of commands you now have at your fingertips, along with a description.\n"

# disable the welcome banner
$env.config.show_banner = false

const _macos_script = 'scripts/macos-specific.nu'
const _windows_script = 'scripts/windows-specific.nu'
const _os_specific_script = if $nu.os-info.name == 'macos' { $_macos_script } else { $_windows_script }
source $_os_specific_script

source scripts/initialization-checks.nu
source scripts/base-aliases.nu
source scripts/git.nu
source scripts/repos.nu
source scripts/intellij.nu
source scripts/starship.nu
source scripts/motivation.nu
use scripts/url.nu *

print "🩷 Reminder to keep up-to-date by periodically running: dotfiles; pull\n"

motivate

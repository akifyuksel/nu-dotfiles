$env.PATH ++= [ '/bin' '/sbin' '/usr/bin' '/usr/sbin' '/usr/local/bin' '/snap/bin' ]

def launch-intellij [project_path: string] {
    let idea_commands = ['idea', 'idea.sh', 'intellij-idea-community-edition', 'intellij-idea-ultimate-edition']
    let idea_cmd = $idea_commands | where { |cmd| which $cmd | is-not-empty } | first
    
    if ($idea_cmd | is-empty) {
        print "IntelliJ IDEA not found. Please install it or add to PATH."
        return
    }
    
    ^$idea_cmd $project_path &
}

def copy-to-clipboard [] {
    if (which xclip | is-not-empty) {
        $in | xclip -selection clipboard
    } else if (which wl-copy | is-not-empty) {
        $in | wl-copy
    } else if (which xsel | is-not-empty) {
        $in | xsel --clipboard --input
    } else {
        print "No clipboard utility found. Please install xclip, wl-copy, or xsel."
    }
}

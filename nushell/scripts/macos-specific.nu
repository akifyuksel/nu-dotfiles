$env.PATH ++= [ '/bin' '/sbin' '/usr/local/bin' '/usr/local/sbin' '/opt/homebrew/bin' '/opt/homebrew/sbin' '/Users/akif/.bun/bin' ]

let _application_paths = ['/Applications', ($nu.home-dir + '/Applications')] | where { |path| $path | path exists }
let _all_applications = $_application_paths | | each {|path| ls --short-names $path} | flatten
let _intellij_app_name = ($_all_applications | where name =~ '.*IntelliJ.*' | get name | to text | str substring 0..-6)

def launch-intellij [project_path: string] {
    ^open -a $_intellij_app_name $project_path
}

def copy-to-clipboard [] {
    $in | pbcopy
}
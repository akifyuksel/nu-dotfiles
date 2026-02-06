const _urlsfile = [$dotfiles_clone_location data urls.yaml] | path join

export def 'url open' [query: string = '' --exact] {
  let search_result = find-url $query $exact
  if ($search_result | is-not-empty) {
    print $'Opening URL: ($search_result.name)'
    start $search_result.url
  }
}

export def 'url copy' [query: string = '' --exact] {
  let search_result = find-url $query $exact
  if ($search_result | is-not-empty) {
    print $'Copy URL to clipboard: ($search_result.name)'
    $search_result.url | copy-to-clipboard
  }
}

def find-url [query: string = '' exact: bool = false] {
  let urls = open $_urlsfile
  let name = if $exact {
    $query
  } else {
    $urls | get name | to text | fzf -i --query=$'($query)' --select-1
  }
  let url = $urls | _find_url_for_exact_name_from_stdin $name
  return { name: $name, url: $url }
}

def _find_url_for_exact_name_from_stdin [name: string] {
    let url = $in | where name == $name | get url
    if ($url | is-empty) {
      print $'Could not find URL for name: "($name)"'
      print $'Check if the entry is correctly defined in: "($_urlsfile)"'
      return null
    }
    return ($url | first)
}
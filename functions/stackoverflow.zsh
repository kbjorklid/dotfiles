
function stackoverflow() {
  emulate -L zsh
  if [[ $# -gt 1 ]]; then
      query="${(j:+:)@[1,-1]}"
  else
      query="$1"
  fi

  if [[ "$query" = "" ]]; then
    open_command "http://www.stackoverflow.com/"
  else 
    open_command "http://www.stackoverflow.com/search?q=$query"
  fi

}

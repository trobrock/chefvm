if [[ ! -o interactive ]]; then
    return
fi

compctl -K _chefvm chefvm

_chefvm() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(chefvm commands) $(chefvm completions use)"
  else
    completions="$(chefvm completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}

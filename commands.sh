: "${FDIR=$HOME}"
: "${FDIR_SYM=h}"

_complete_file() {
    _init_completion -s || return
    _filedir
}

_cd_completion() {
    CDPATH="$FDIR" _cd
}

_mvcp_completion() {
    if [[ "$COMP_CWORD" == "$1" ]] ; then
        _cur_pwd="$(pwd)"
        cd "$FDIR" && _complete_file
        cd "$_cur_pwd"
    else
        _complete_file
    fi
}

_mvh_completion() {
    _mvcp_completion 2
}

_mvfh_completion() {
    _mvcp_completion 1
}

_cdh() {
    cd "$FDIR"/"$1"
}

_mvh() {
    mv "$1" "$FDIR"/"$2"
}

_cph() {
    cp "$1" "$FDIR"/"$2"
}

_mvfh() {
    mv "$FDIR"/"$1" "${2-.}"
}

_cpfh() {
    cp "$FDIR"/"$1" "${2-.}"
}

complete -o nospace -F _cd_completion "cd${FDIR_SYM}"
complete -o nospace -F _mvh_completion "mv${FDIR_SYM}"
complete -o nospace -F _mvh_completion "cp${FDIR_SYM}"
complete -o nospace -F _mvfh_completion "mvf${FDIR_SYM}"
complete -o nospace -F _mvfh_completion "cpf${FDIR_SYM}"

alias "cd${FDIR_SYM}"=_cdh
alias "mv${FDIR_SYM}"=_mvh
alias "cp${FDIR_SYM}"=_cph
alias "mvf${FDIR_SYM}"=_mvfh
alias "cpf${FDIR_SYM}"=_cpfh

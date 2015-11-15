: ${FDIR="$HOME"}
: ${FDIR_SYM=h}

_complete_file() {
	local cur prev words cword split;
    _init_completion -s || return;
	_filedir;
}

_cd_completion() {
	export CDPATH=$FDIR
	_cd
}

_mvh_completion() {
	if [[ ${COMP_CWORD} == 2 ]] ; then
		_cur_pwd=$(pwd)
		cd $FDIR && _complete_file;
		cd $_cur_pwd
	else
		_complete_file;
	fi
}

_mvfh_completion() {
	if [[ ${COMP_CWORD} == 1 ]] ; then
		_cur_pwd=$(pwd)
		cd $FDIR && _complete_file;
		cd $_cur_pwd
	else
		_complete_file;
	fi
}

_cdh() {
	cd "$FDIR"/"$1"
}

_mvh() {
	s="$1"
	d="$FDIR"/"$2"
	mv "$s" "$d"
}

_cph() {
	s="$1"
	d="$FDIR"/"$2"
	cp "$s" "$d"
}

_mvfh() {
	d="$2"
	if [ $# -eq 1 ]; then
		d="./"
	fi
	mv "$FDIR"/"$1" "$d"
}

_cpfh() {
	d="$2"
	if [ $# -eq 1 ]; then
		d="./"
	fi
	cp "$FDIR"/"$1" "$d"
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

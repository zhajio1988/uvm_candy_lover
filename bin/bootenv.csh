export YASA_SIMULATOR=vcs

curdir=$(cd $(dirname ${BASH_SOURCE[0]}); cd ..; pwd)

export PRJ_HOME=$curdir
export PRJ_NAME=`basename ${PRJ_HOME}`
#export UVM_HOME=`ncroot`/tools/methodology/UVM/CDNS-1.1d
export VERDI_HOME=/usr/local/synopsys/verdi2015
export NOVAS_TAB=$VERDI_HOME/share/PLI/VCS/LINUX64/novas.tab
export NOVAS_PLI=$VERDI_HOME/share/PLI/VCS/LINUX64/pli.a

alias YASAsim="python3 $PRJ_HOME/bin/YASA/yasaTop.py"

export NOVAS_EDIT_SOURCE=1
export FSDB_DUMP_RIDB=1

### auto completion ###
_show_complete()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=`YASAsim -h | grep '^  -' | awk '{print $1}'`
    #node_names=`python3 $PRJ_HOME/bin/node_names.py`

    if [[ ${cur} == -* ]] ; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
    fi

    #COMPREPLY=( $(compgen -W "${node_names}" -- ${cur}) )
}

complete -F _show_complete YASAsim

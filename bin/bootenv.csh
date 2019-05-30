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
    show='test\ngroup\nbuild\n'
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    all_opts=`YASAsim -h | grep '^  -' | awk '{print $1}'`

    case $prev in
    'lsf')
        cmd_opts=`YASAsim lsf -h | grep '^  -' | awk '{print $1}'` ;;
    '-t')
        cmd_opts=`YASAsim -show test | grep -P '\t\t.*' | awk '{print $1}'` ;;
    '-b')
        cmd_opts=`YASAsim -show build | grep -P '\t.*' | awk '{print $1}'` ;;         
    '-g')
        cmd_opts=`YASAsim -show group | grep -P '\t.*' | awk '{print $1}'` ;;  
    '-show')
        cmd_opts=`printf $show` ;;      
    '*')
          ;;
    esac

    if [[ (${prev} == "-t" || ${prev} == "-b" || ${prev} == "-g" || ${prev} == "-show") && ${cur} == * ]] ; then
        COMPREPLY=( $(compgen -W "${cmd_opts}" -- ${cur}) )
        #return 0
    fi

    if [[ ${prev} == "lsf" && ${cur} == -* ]] ; then
        COMPREPLY=( $(compgen -W "${cmd_opts}" -- ${cur}) )
        return 0
    fi

    if [[ ${prev} != "lsf" && ${cur} == -* ]] ; then
        COMPREPLY=( $(compgen -W "${all_opts}" -- ${cur}) )
        return 0
    fi

}

complete -F _show_complete YASAsim

### demo function ###
_foo()
{
    COMPREPLY=()
    local cur=${COMP_WORDS[COMP_CWORD]};
    local cmd=${COMP_WORDS[COMP_CWORD-1]};
    case $cmd in
    'foo')
          COMPREPLY=( $(compgen -W 'help test read' -- $cur) ) ;;
    'test')
          local pro=( $(awk '{print $1}' ./data/a.txt) )
          COMPREPLY=( $(compgen -W '${pro[@]}' -- $cur) ) ;;
    '*')
          ;;
    esac
    if [[ "${COMP_WORDS[1]}" == "read" && ${COMP_CWORD} -eq 2 ]]; then
          local pro=($(pwd))
          cd ./data
          compopt -o nospace
          COMPREPLY=($(compgen -d -f -- $cur))
          cd $pro
    fi
    return 0
}
complete -F _foo foo

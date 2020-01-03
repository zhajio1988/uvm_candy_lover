############################################################ 
# YASAsim specified envvar
############################################################ 
export YASA_SIMULATOR=vcs
curdir=$(cd $(dirname ${BASH_SOURCE[0]}); cd ..; pwd)

### project specified envvar ###
export PRJ_HOME=$curdir
export PRJ_NAME=`basename ${PRJ_HOME}`
alias YASAsim="python3 $PRJ_HOME/bin/YASA/yasaTop.py"

### eda tools specified env var ###
export NOVAS_EDIT_SOURCE=1
#export FSDB_DUMP_RIDB=1

### auto completion ###
_show_complete()
{
    local cur prev opts
    show='test\ngroup\nbuild\n'
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD - 1]}"

    if [[ "$prev" == "-t" ]]; then
        pprev="${COMP_WORDS[COMP_CWORD - 2]}" 
        ppprev="${COMP_WORDS[COMP_CWORD - 3]}" 
    fi   

    case $prev in
    'lsf')
        cmd_opts=`YASAsim lsf -h | \grep '^  -' | awk '{print $1}'` ;;
    '-t')
        if [[ "$ppprev" == "-b" ]]; then
            cmd_opts=`YASAsim -b $pprev -show test | \grep -P '\t\t.*' | awk '{print $1}'`
        else
            cmd_opts=`YASAsim -show test | \grep -P '\t\t.*' | awk '{print $1}'`
        fi
        ;;
    '-b') 
        cmd_opts=`YASAsim -show build | \grep -P '\t.*' | awk '{print $1}'` ;;         
    '-g')
        cmd_opts=`YASAsim -show group | \grep -P '\t.*' | awk '{print $1}'` ;;        
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
        all_opts=`YASAsim -h | \grep '^  -' | awk '{print $1}' | sed 's/,//g'`
        COMPREPLY=( $(compgen -W "${all_opts}" -- ${cur}) )
        return 0
    fi

}

complete -F _show_complete YASAsim

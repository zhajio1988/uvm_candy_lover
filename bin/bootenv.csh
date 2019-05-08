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

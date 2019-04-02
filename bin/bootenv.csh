export YASA_SIMULATOR=vcs

export PRJ_HOME=`pwd`
export PRJ_NAME=`basename ${PRJ_HOME}`
#export UVM_HOME=`ncroot`/tools/methodology/UVM/CDNS-1.1d
export VERDI_HOME=/opt/Synopsys/Verdi2015/
export NOVAS_TAB=$VERDI_HOME/share/PLI/VCS/LINUX64/novas.tab
export NOVAS_PLI=$VERDI_HOME/share/PLI/VCS/LINUX64/pli.a

alias YASAsim="python3 $PRJ_HOME/bin/YASA/yasaTop.py"

export NOVAS_EDIT_SOURCE=1
export FSDB_DUMP_RIDB=1

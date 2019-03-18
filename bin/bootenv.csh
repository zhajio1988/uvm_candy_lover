export YASA_SIMULATOR=irun

export PRJ_HOME=`pwd`
export PRJ_NAME=`basename ${PRJ_HOME}`
export UVM_HOME=`ncroot`/tools/methodology/UVM/CDNS-1.1d
alias YASAsim="python3 $PRJ_HOME/bin/YASA/yasaTop.py"

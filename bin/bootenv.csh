setenv YASA_SIMULATOR "vcs"

setenv PRJ_HOME `pwd`
setenv PRJ_NAME `basename ${PRJ_HOME}`
#setenv UVM_HOME=`ncroot`/tools/methodology/UVM/CDNS-1.1d
setenv NOVAS_TAB $VERDI_HOME/share/PLI/VCS/LINUX64/novas.tab
setenv NOVAS_PLI $VERDI_HOME/share/PLI/VCS/LINUX64/pli.a

alias YASAsim "python3 $PRJ_HOME/bin/YASA/yasaTop.py"

setenv NOVAS_EDIT_SOURCE 1
setenv FSDB_DUMP_RIDB 1

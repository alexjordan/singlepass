#! /bin/sh
RUNJS=/nfstmp/epicopt/opt/ccsv5/ccs_base_5.0.0.00053/scripting/bin/dss.sh
CONFIG=/nfstmp/epicopt/opt/ccsv5/TargetConf/c64xAccurate.ccxml

export UTIL_PATH=$(dirname $(which $0))
$RUNJS $UTIL_PATH/retcatch.js -c $CONFIG $@

initlog() {
	date >> cycles.log
}

logcycles() {
	outfile=$1
	cycles=$2
	echo -e " OK ($cycles)    $outfile" | cat >> cycles.log
}

# args: outfile, expected
runtest() {
	outfile=$1
	expected=$2
    ./retcatch.sh -c $CONFIG $outfile &> .out
	rc=`awk 'BEGIN{ RS="retval = ";} { gsub(/[^0-9].*/,"",$1); if ($1 != ""){ print $1; } }' .out`
	cycles=`awk 'BEGIN{ RS="took ";} { gsub(/[^0-9].*/,"",$1); if ($1 != ""){ print $1; } }' .out`
    if [ $rc = $expected ]; then
      echo -e " OK     $outfile"
	  logcycles $outfile $cycles
    else
      echo
      echo -e " FAIL   $outfile"
      echo    "        - expected: ($expected)"
      echo    "        - returned: ($rc)"
      echo
      if [ "$verbose" = "1" ]; then
        cat .out
      fi
    fi
    rm -f .out
}



# tool paths (mostly no defaults). override in user.mk
# paths to the llvm tools
CLANGPATH=/foo/bin
OPTPATH=/foo/bin
LLCPATH=/foo/bin

# program to compile and link TI (cl6x)
TICC=/foo/bin/cl6x

# include and lib path to the system library for TI
SYSINCLUDEPATH=/foo/include
SYSLIBPATH=/foo/lib

# loadti tool that runs the simulator from the command line
LOADTI=/foo/loadti.sh

# simulator config (currently comes with singlepass)
CONFIG=./c64xAccurate.ccxml

CLANGOPTS=-ccc-host-triple tms320c64x-unknown-gnu-linux -S -emit-llvm \
		 -DSTART_PROFILING="asm(\"bench_begin:\")" \
		 -DEND_PROFILING="asm(\"bench_end:\")" \
		 -Dnear= -Dfar= \
		 -Xclang -isystem${SYSINCLUDEPATH} \
		 -Werror
OPTOPTS=-mem2reg
LLCOPTS=-march=tms320c64x

# ABI switching (needs to reflect ABI in LLC)
#TIABIOPTS=--abi=coffabi
TIABIOPTS=--abi=eabi --long_precision_bits=32
TICCASMOPTS=-mv64+ -as -k --symdebug:none ${TIABIOPTS}
TICCOPTS= ${TICCASMOPTS} \
	   -i"${SYSLIBPATH}" \
	   -i"${SYSINCLUDEPATH}"

LDOPTS=-mv64+ \
	   --warn_sections -i"${SYSINCLUDEPATH}" \
	   -i"${SYSLIBPATH}" --reread_libs --rom_model

GREP=grep -v "\.\(file\|type\)"

AWKRET=awk 'BEGIN{ RS="retval = ";} { gsub(/[^0-9].*/,"",$$1); if ($$1 != ""){ print $$1; } }'

# environment/user specific overrides go in here
include user.mk

define clang-cmd
${CLANGPATH}/clang ${CLANGOPTS} -S -o $@ $<
endef

define opt-cmd
${OPTPATH}/opt ${OPTOPTS} -S -o $@ $<
endef

define as-cmd
${LLCPATH}/llvm-as $< -o $@
endef

define llc-cmd
${LLCPATH}/llc ${LLCOPTS} $< -o $@
endef

define ticc-asm-cmd
${TICC} ${TICCASMOPTS} -c $< --output_file=$@
endef

define ticc-compile-cmd
${TICC} ${TICCOPTS} -c $< --output_file=$@
endef

define link-cmd
${TICC} -z ${LDOPTS} -o $@ $^ -llibc.a lnk.cmd
endef

define clean-cmd
rm -f *.obj *.ll *.asm
endef

define bench-cmd
../benchmark.sh $<
endef

define run-cmd
${LOADTI} -c ${CONFIG} $<
endef

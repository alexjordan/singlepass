include defs.mk

cfiles := $(wildcard *.c)
llfiles := $(wildcard *.ll)

thefiles := $(cfiles:.c=.out) $(llfiles:.ll=.out)
outfiles := $(thefiles:%.out=Output/%.out)
tifiles := $(thefiles:%.out=Reference/%.reference)

.PRECIOUS: Output/%.bc Output/%.ll Output/%.asm
#sgccfiles := $(cfiles:.c=.s-gcc)
#sllvmfiles := $(cfiles:.c=.s-llvm)


#compile: $(bcfiles) $(sgccfiles) $(sllvmfiles)
compile: $(outfiles) $(tifiles)

expected-returns: gen-expected-returns
	./gen-expected-returns

# compile for reference and move the .asm file that gets created in the cwd
Reference/%.obj: %.c Reference/.dir
	$(ticc-compile-cmd)
	mv -f *.asm  Reference/

Reference/%.out: Reference/%.obj
	$(link-cmd)

Reference/%.reference: Reference/%.out
	./retcatch.sh -c ${CONFIG} $< | grep retval | ${AWKRET} > $@

# just copy predefined reference output
Reference/%.reference: %.reference
	cp $< $@

Output/%.ll: %.c Output/.dir
	$(clang-cmd)

Output/%.bc: %.ll Output/.dir
	$(as-cmd)

Output/%.bc: Output/%.ll
	$(as-cmd)

Output/%.s: Output/%.bc
	$(llc-cmd)

Output/%.asm: Output/%.s
	echo -e ${ASMHEAD} | cat - $< > $@

Output/%.obj: Output/%.asm
	$(ticc-asm-cmd)

Output/%.out: Output/%.obj
	$(link-cmd)

Output/.dir:
	mkdir -p Output
	touch $@

Reference/.dir:
	mkdir -p Reference
	touch $@

#%.s-gcc: %.c
#	gcc -c -fomit-frame-pointer $< -o gcc.out
#	objdump -d gcc.out > $@
#	rm -f gcc.out

#%.s-llvm: %.c
#	gcc -c -fomit-frame-pointer $< -o llvm.out
#	objdump -d llvm.out > $@
#	rm -f llvm.out

#run: ${FILE}.bc
#	lli -stats -regalloc=linearscan -time-passes -mtriple=i686-pc-linux-gnu -relocation-model=pic -march=x86-64 -print-machineinstrs $<

#dis: ${FILE}.bc
#	llvm-dis < $< > ${FILE}.s

clean:
	rm -f *.bc *.s-gcc *.s-llvm gcc.out llvm.out *.bz2 *.asm *.obj *.out
	rm -rf Output
	rm -f BreakpointsTestLog.xml BreakpointsTestLog.xml.*

very-clean: clean
	rm -rf Reference

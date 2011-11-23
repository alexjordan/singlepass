// this makes assumptions about the stack layout to figure out if we can
// calculate stack offsets larger than 16-bit.

#include <stdlib.h>
#include <stdio.h>

#define MAXARRAY 2000

struct myStringStruct {
	char str[128];
};

int return_lea(char *p) {
	return (int) p;
}

int small_stack(void) {
	struct myStringStruct foo;
	return return_lea(foo.str);
}

int big_stack(void) {
	struct myStringStruct array[MAXARRAY];
	return return_lea((void *)array);
}

int main(int argc, char **argv) {
	int ptr1, ptr2;
	ptr1 = small_stack();
	// the printfs are important to keep the compilers from optimizing
	printf("0x%x\n", ptr1);
	ptr2 = big_stack();
	printf("0x%x\n", ptr2);
	return (ptr2 + 128 * 1000) < ptr1;
}

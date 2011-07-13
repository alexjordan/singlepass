#include <stdlib.h>

int foo(int *x) {
	return *x;
}

int main(int argc, char **argv) {
	int x = rand();
	return foo(&x);
}

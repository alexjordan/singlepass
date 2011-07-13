#include <stdlib.h>

int x;

void foo(int *ret) {
	++x;
	*ret = x;
}

int main(int argc, char **argv) {
	int y;
	x = rand();
	++x;
	foo(&y);
	return y;
}

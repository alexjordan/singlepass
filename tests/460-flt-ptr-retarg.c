#include <stdlib.h>

float x;

void foo(float *ret) {
	++x;
	*ret = x;
}

int main(int argc, char **argv) {
	float y;
	x = rand();
	++x;
	foo(&y);
	return y;
}

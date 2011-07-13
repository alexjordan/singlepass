#include <stdlib.h>

double x = 42.;

double foo(double bar, double *ret) {
	*ret = x;
	return bar;
}

int main(int argc, char **argv) {
	double y;
	++x;
	foo(y, &y);
	return y;
}

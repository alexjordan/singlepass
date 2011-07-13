#include <stdlib.h>
#include <math.h>

int main(int argc, char **argv) {
	double x = 42.7;
	double y = rand();
	modf(x, &y);
	return y;
}

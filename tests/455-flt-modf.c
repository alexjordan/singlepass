#include <stdlib.h>
#include <mathf.h>

int main(int argc, char **argv) {
	float x = 42.7;
	float y = rand();
	modff(x, &y);
	return y;
}

#include <stdlib.h>
#include <limits.h>
#define FOO 5

int doswitch(int x) {
	switch(x) {
	case 0: return -1;
	case 2: return -2;
	case 8: return -3;
	case FOO: return 42;
	case INT_MAX: return -5;
	default: return -6;
	}
}

int main(int argc, char **argv) {
  int r = rand();
  return doswitch(r) + doswitch(argc);
}

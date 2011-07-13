#include <stdlib.h>

int x = 42;

int foo(int r, int *p, int *q) {
	*p = r;
	return *q;
}
int main(int argc, char **argv) {
  int r = rand();

  return foo(r, &x, &x);
}

#include <stdlib.h>

int x = 42;
int *p = 0;

int foo(int *p, int c) {
  int r;
  int y = c;
  r = rand();
  if (0 != r) {
    y = *p; // this may trap
  }

  return y;
}

int main() {
	return foo(&x, 7);
}

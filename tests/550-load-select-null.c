#include <stdlib.h>

int x = 42;

int unsafe_load_select(int *p) {
  int r;
  int y = 7;
  r = rand();
  if (0 == r) {
    y = *p;
  }
  return y;
}

int main(int argc, char **argv) {
	return unsafe_load_select(&x);
}

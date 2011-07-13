#include <stdlib.h>

unsigned hideme(unsigned x) {
	return x;
}

int main(int argc, char **argv) {
  unsigned r = rand();
  unsigned s = hideme(r);
  return (r >= s);
}

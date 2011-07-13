#include <stdlib.h>

int hideme(int x) {
	return x;
}

int main(int argc, char **argv) {
  int r = rand();
  int s = hideme(r);
  return (r != s);
}

#include <stdlib.h>

int main(int argc, char **argv) {
  static int x[16];
  x[15] = 42;
  x[0] = rand();
  return x[0] + x[15];
}

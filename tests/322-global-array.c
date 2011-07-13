#include <stdlib.h>

int x[16];

int main(int argc, char **argv) {
  x[15] = 42;
  x[0] = rand();
  return x[0] + x[15];
}

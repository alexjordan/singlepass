#include <stdlib.h>

int main(int argc, char **argv) {
  static int x = 42;
  x = rand();
  return x;
}

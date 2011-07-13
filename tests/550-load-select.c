#include <stdlib.h>

int x = 42;

int main(int argc, char **argv) {
  int r;
  int y = argc;
  r = rand();
  if (0 == r) {
    y = x;
  }

  return y;
}

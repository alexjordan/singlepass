#include <stdlib.h>

int x1 = 21;
int x2 = 21;

int main(int argc, char **argv) {
  int r;
  int y = argc;
  r = rand();
  if (0 == r) {
    y = x1 + x2;
  }

  return y;
}

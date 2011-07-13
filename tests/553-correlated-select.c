#include <stdlib.h>

int x = 42;

int main(int argc, char **argv) {
  int r;
  int y = argc;
  r = rand();
  if (r > 5) {
    y = x;
  }
  if (r > 0) {
    y += 7;
  }

  return y;
}

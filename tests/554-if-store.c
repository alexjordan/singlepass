#include <stdlib.h>

int x = 42;

int main(int argc, char **argv) {
  int r;
  r = rand();
  if (0 == r) {
    x = 7;
  }
  rand();

  return x;
}

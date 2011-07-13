#include <stdlib.h>

int main(int argc, char **argv) {
  int x, y;
  int r = rand();
  if (0 == r) {
    rand();
    y = rand();
    x = 7;
  }
  else {
    y = rand();
    x = 42;
  }
  return x;
}

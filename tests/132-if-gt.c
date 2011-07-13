#include <stdlib.h>

int main(int argc, char **argv) {
  int x, y;
  int r = rand();
  if (r > 0) {
    y = rand();
    x = 42;
  }
  else {
    rand();
    y = rand();
    x = 7;
  }
  return x;
}

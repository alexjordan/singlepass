#include <stdlib.h>

int main(int argc, char **argv) {
  int x;
  int r = rand();
  if (!(r < 0)) {
    x = 42;
  }
  else {
    x = 7;
  }
  return x;
}

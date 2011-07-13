#include <stdlib.h>

int main(int argc, char **argv) {
  int x;
  int r = rand();
  if (0 <= r) {
    x = 42;
  }
  else {
    x = 7;
  }
  return x;
}

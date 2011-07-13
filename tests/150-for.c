#include <stdlib.h>

int main(int argc, char **argv) {
  int x = 1;
  int i;
  for (i=0; i<3; i++) {
    x += x;
  }
  return x;
}

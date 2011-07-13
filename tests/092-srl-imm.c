#include <stdlib.h>

int main(int argc, char **argv) {
  unsigned x = rand() + 255;
  return x >> 3;
}

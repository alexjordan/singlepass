#include <stdlib.h>

int main(int argc, char **argv) {
  float x = rand();
  float y = rand();

  return (int) (x * y) + (x / y) + (x - y);
}

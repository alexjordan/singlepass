#include <stdlib.h>

int main(int argc, char **argv) {
  double x = rand();
  double y = rand();

  return (int) (x * y) + (x / y) + (x - y);
}

#include <stdlib.h>

int main(int argc, char **argv) {
  int x,y;
  x = rand();
  x *= -5;
  y = rand();
  y *= -3;
  return x * y - 204;
}
